import type { Player, QuizQuestion } from '../types/quiz';

export enum PacketTypes {
  Connect,
  HostGame,
  QuestionShow,
  ChangeGameState,
  PlayerJoin,
  StartGame,
  Tick,
}

export enum GameState {
  Lobby,
  Play,
  Reveal,
  End
}

export interface Packet {
  id: PacketTypes;
}

export interface ConnectPacket extends Packet {
  code: string;
  name: string;
}

export interface HostGamePacket extends Packet {
  quizId: string;
}

export interface ChangeGameStatePacket extends Packet {
  state: GameState;
}

export interface PlayerJoinPacket extends Packet {
  player: Player;
}

export interface TickPacket extends Packet {
  tick: number;
}

export interface QuestionShowPacket extends Packet {
  question: QuizQuestion;
}

export class NetService {
  private websocket!: WebSocket;
  private textDecoder: TextDecoder = new TextDecoder();
  private textEncoder: TextEncoder = new TextEncoder();

  private onPacketCallback?: (packet: any) => void;

  connect() {
    this.websocket = new WebSocket('ws://localhost:3000/ws');
    this.websocket.onopen = () => {
      console.log('opened connection');
    };

    this.websocket.onmessage = async (event: MessageEvent) => {
      const arrayBuffer: Iterable<number> = await event.data.arrayBuffer();
      const bytes: Uint8Array = new Uint8Array(arrayBuffer);
      const packetId: number = bytes[0];

      const packet = JSON.parse(this.textDecoder.decode(bytes.subarray(1)));
      packet.id = packetId;

      console.log('Packet ID: ', packetId);
      console.log('Packet: ',packet);

      if (this.onPacketCallback)
        this.onPacketCallback(packet);
    }
  }

  onPacket(callback: (packet: Packet) => void) {
    this.onPacketCallback = callback;
  }

  sendPacket(packet: Packet) {
    const packetId: number = packet.id;
    const packetData: string = JSON.stringify(packet);

    console.log(packetData)

    const packetIdArray: Uint8Array = new Uint8Array([packetId]);
    const packetDataArray: Uint8Array = this.textEncoder.encode(packetData);

    const mergedArray: Uint8Array = new Uint8Array(
      packetIdArray.length + packetDataArray.length,
    );
    mergedArray.set(packetIdArray);
    mergedArray.set(packetDataArray, packetIdArray.length);

    this.websocket.send(mergedArray);
  }
}
class BiodataModel {
  int id;
  String userId;
  String? nama;
  String? tempatLahir;
  String? tanggalLahir;
  String? alamat;
  String? usia;
  String? jenisKelamin;
  String? pendidikan;
  String? pekerjaan;
  String? statusTinggal;
  String? fase;
  String createdAt;
  String updatedAt;

  BiodataModel({
    required this.id,
    required this.userId,
    this.nama,
    this.tempatLahir,
    this.tanggalLahir,
    this.alamat,
    this.usia,
    this.jenisKelamin,
    this.pendidikan,
    this.pekerjaan,
    this.statusTinggal,
    this.fase,
    required this.createdAt,
    required this.updatedAt,
  });

  static BiodataModel empty() => BiodataModel(
      id: 0,
      userId: '',
      nama: '',
      tempatLahir: '',
      tanggalLahir: '',
      alamat: '',
      usia: '',
      jenisKelamin: '',
      pendidikan: '',
      pekerjaan: '',
      statusTinggal: '',
      fase: '',
      createdAt: '',
      updatedAt: '');

  factory BiodataModel.fromJson(Map<String, dynamic> json) => BiodataModel(
        id: json["id"] ?? 0,
        userId: json["user_id"] ?? "",
        nama: json["nama"],
        tempatLahir: json["tempat_lahir"],
        tanggalLahir: json["tanggal_lahir"],
        alamat: json["alamat"],
        usia: json["usia"],
        jenisKelamin: json["jenis_kelamin"],
        pendidikan: json["pendidikan"],
        pekerjaan: json["pekerjaan"],
        statusTinggal: json["status_tinggal"],
        fase: json["fase"],
        createdAt: json["created_at"] ?? "",
        updatedAt: json["updated_at"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "nama": nama,
        "tempat_lahir": tempatLahir,
        "tanggal_lahir": tanggalLahir,
        "alamat": alamat,
        "usia": usia,
        "jenis_kelamin": jenisKelamin,
        "pendidikan": pendidikan,
        "pekerjaan": pekerjaan,
        "status_tinggal": statusTinggal,
        "fase": fase,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

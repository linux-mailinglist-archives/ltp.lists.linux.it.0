Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE61C17AA76
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 17:24:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 336D83C6535
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 17:24:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id B461B3C64AC
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 17:24:55 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C19A61402005
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 17:24:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583425493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=65G1VOtWWZCvaMvAdW7abwTe7lD47N+L8qs6QmejZ2Q=;
 b=P0ECQZCKXWp9SLxZjgQeDB7Y7o4EnyFbxnIFHGa9rrFwVzhyv+fa84kDZ1vanBau/KWZC6
 YxCk4XPIYp/lbLyZm2n0Z2jyyE7d7/g7zWN5n6DI2tJSF5b1B/oWtmmOQiyIAaf0+FXj1s
 2I95jvBZYpNWyv89A6s53KkzOPpyMhk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-A9JiEQfJPOG1YRymGXvUWQ-1; Thu, 05 Mar 2020 11:24:49 -0500
X-MC-Unique: A9JiEQfJPOG1YRymGXvUWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCCA8801A1B;
 Thu,  5 Mar 2020 16:24:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D10272A2;
 Thu,  5 Mar 2020 16:24:48 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A84AE84484;
 Thu,  5 Mar 2020 16:24:48 +0000 (UTC)
Date: Thu, 5 Mar 2020 11:24:48 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: CKI Project <cki-project@redhat.com>, 
 Linux Stable maillist <stable@vger.kernel.org>
Message-ID: <2065777364.10425170.1583425488638.JavaMail.zimbra@redhat.com>
In-Reply-To: <cki.EED856DF66.LLEP90YP5M@redhat.com>
References: <cki.EED856DF66.LLEP90YP5M@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.6]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.5.7-60528b7.cki (stable-queue)
Thread-Index: kkuOJFuqhkSqHy2lWMvJx4dG0KzmcQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E5?=
 =?utf-8?q?=2E7-60528b7=2Ecki_=28stable-queue=29?=
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gCj4gSGVsbG8sCj4gCj4gV2UgcmFuIGF1
dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5lbCB0cmVlOgo+
IAo+ICAgICAgICBLZXJuZWwgcmVwbzoKPiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LXN0YWJsZS1yYy5naXQKPiAgICAg
ICAgICAgICBDb21taXQ6IDYwNTI4Yjc5ZTMwYSAtIGt2bTogblZNWDogVk1XUklURSBjaGVja3Mg
dW5zdXBwb3J0ZWQKPiAgICAgICAgICAgICBmaWVsZCBiZWZvcmUgcmVhZC1vbmx5IGZpZWxkCj4g
Cj4gVGhlIHJlc3VsdHMgb2YgdGhlc2UgYXV0b21hdGVkIHRlc3RzIGFyZSBwcm92aWRlZCBiZWxv
dy4KPiAKPiAgICAgT3ZlcmFsbCByZXN1bHQ6IEZBSUxFRCAoc2VlIGRldGFpbHMgYmVsb3cpCj4g
ICAgICAgICAgICAgIE1lcmdlOiBPSwo+ICAgICAgICAgICAgQ29tcGlsZTogT0sKPiAgICAgICAg
ICAgICAgVGVzdHM6IEZBSUxFRAo+IAo+IEFsbCBrZXJuZWwgYmluYXJpZXMsIGNvbmZpZyBmaWxl
cywgYW5kIGxvZ3MgYXJlIGF2YWlsYWJsZSBmb3IgZG93bmxvYWQgaGVyZToKPiAKPiAgIGh0dHBz
Oi8vY2tpLWFydGlmYWN0cy5zMy51cy1lYXN0LTIuYW1hem9uYXdzLmNvbS9pbmRleC5odG1sP3By
ZWZpeD1kYXRhd2FyZWhvdXNlLzIwMjAvMDMvMDQvNDcxNTA1Cj4gCj4gT25lIG9yIG1vcmUga2Vy
bmVsIHRlc3RzIGZhaWxlZDoKPiAKPiAgICAgczM5MHg6Cj4gICAgICDinYwgTFRQCgpBbGwgaW5z
dGFuY2VzIG9mIHNpbWlsYXIgcGFuaWNzIFsxXSBtYW5pZmVzdCBtb3N0bHkgb24gczM5MCBhbmQg
YXQKZmlyc3QgZ2xhbmNlIGxvb2sgbGlrZSBtZW1vcnkgY29ycnVwdGlvbnMuCgpJJ20gbG9va2lu
ZyB0byBjb25maXJtLCB3aGV0aGVyIHRoaXMgaGFzIGJlZW4gZml4ZWQgYnk6CgogIGNvbW1pdCA2
ZmNjYTBmYTQ4MTE4ZTZkNjM3MzNlYjQ2NDRjNmNkODgwYzE1YjhmCiAgQXV0aG9yOiBTdXJlbiBC
YWdoZGFzYXJ5YW4gPHN1cmVuYkBnb29nbGUuY29tPgogIERhdGU6ICAgTW9uIEZlYiAzIDEzOjIy
OjE2IDIwMjAgLTA4MDAKCiAgICBzY2hlZC9wc2k6IEZpeCBPT0Igd3JpdGUgd2hlbiB3cml0aW5n
IDAgYnl0ZXMgdG8gUFNJIGZpbGVzCgpbMV0gClsgIDQzNy4zOTc0NTVdIGFkZHJlc3NpbmcgZXhj
ZXB0aW9uOiAwMDA1IGlsYzoyIFsjMV0gU01QICAgICAgIApbICA0MzcuMzk3NDY0XSBNb2R1bGVz
IGxpbmtlZCBpbjogc3VucnBjIGdoYXNoX3MzOTAgcHJuZyBhZXNfczM5MCBkZXNfczM5MCBsaWJk
ZSAKcyBxZXRoX2wyIHFldGggcWRpbyBjY3dncm91cCBzaGE1MTJfczM5MCB2ZmlvX2NjdyB2Zmlv
X21kZXYgbWRldiB2ZmlvX2lvbW11X3R5cGUgCjEgc2hhMV9zMzkwIHZmaW8gaXBfdGFibGVzIHhm
cyBsaWJjcmMzMmMgY3JjMzJfdnhfczM5MCBzaGEyNTZfczM5MCBzaGFfY29tbW9uIGRhIApzZF9l
Y2tkX21vZCBkYXNkX21vZCBwa2V5IHpjcnlwdCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAKWyAgNDM3LjM5NzQ5MF0gQ1BVOiAzIFBJRDogMTAyOSBDb21t
OiByZWFkX2FsbCBOb3QgdGFpbnRlZCA1LjUuNy02MDUyOGI3LmNraSAjMSAgClsgIDQzNy4zOTc0
OTNdIEhhcmR3YXJlIG5hbWU6IElCTSAyOTY0IE45NiA0MDAgKHovVk0gNi40LjApICAgICAgICAg
ICAgICAgICAgICAgIApbICA0MzcuMzk3NDk3XSBLcm5sIFBTVyA6IDA3MDRlMDAxODAwMDAwMDAg
MDAwMDAwMDBiYmY0ZTUwOCAoY29sbGVjdF9wZXJjcHVfdGltZSAKcysweGQwLzB4MjQwKSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgClsgIDQzNy4zOTc1MDddICAgICAgICAgICAgUjowIFQ6MSBJTzoxIEVYOjEgS2V5OjAg
TToxIFc6MCBQOjAgQVM6MyBDQzoyIFBNOjAgUkk6IAowIEVBOjMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAK
WyAgNDM3LjM5NzUxMV0gS3JubCBHUFJTOiAwMDAwMDAwMTQyMzc0MDAwIDAwMDAwMDAxNDIzMTQw
MDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAgCjAwMDAwYmNhNGQ1YTggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApbICA0Mzcu
Mzk3NTE0XSAgICAgICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAw
MDAwMTQyMzE0MDE0IDAwMCAKMDAwMDAwMDAwMDAwMCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgClsgIDQzNy4zOTc1MThd
ICAgICAgICAgICAgMDAwMDAzZTAwMDkyZmNlMCAwMDAwMDNlMDAwOTJmZDIwIDAwMDAwMDAwMDAw
MDAwMDEgMDAwIAowMDAwMTQyMzE0MDAwICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKWyAgNDM3LjM5NzUyMV0gICAgICAg
ICAgICAwMDAwMDAwMWU0N2Q2MDAwIDAwMDAwMDAxZmIwN2ZkNDAgMDAwMDAwMDBiYmY0ZTRjOCAw
MDAgCjAwM2UwMDA5MmZjMDAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIApbICA0MzcuMzk3NTM5XSBLcm5sIENvZGU6IDAw
MDAwMDAwYmJmNGU0ZmM6IGI5MDQwMGIxICAgICAgICAgICAgbGdyICAgICAlcjExLCVyMSAKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgClsgIDQzNy4zOTc1MzldICAgICAgICAgICAgMDAwMDAwMDBi
YmY0ZTUwMDogNDE2MDEwMTQgICAgICAgICAgICBsYSAgICAgICVyNiwyMCglIApyMSkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKWyAgNDM3LjM5NzUzOV0gICAgICAgICAgICMwMDAwMDAwMGJiZjRlNTA0
OiA1ODcwYjAwMCAgICAgICAgICAgIGwgICAgICAgJXI3LDAoJXIgCjExKSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIApbICA0MzcuMzk3NTM5XSAgICAgICAgICAgPjAwMDAwMDAwYmJmNGU1MDg6IGE3NzEw
MDAxICAgICAgICAgICAgdG1sbCAgICAlcjcsMSAgICAKWyAgNDM3LjM5NzUzOV0gICAgICAgICAg
ICAwMDAwMDAwMGJiZjRlNTBjOiBhNzc0MDA2ZCAgICAgICAgICAgIGJyYyAgICAgNywwMDAwMDAg
CjAwYmJmNGU1ZTYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIApbICA0MzcuMzk3NTM5XSAgICAgICAgICAgIDAwMDAw
MDAwYmJmNGU1MTA6IGMwZTVmZmZhYmFkYyAgICAgICAgYnJhc2wgICAlcjE0LDAwMCAKMDAwMDBi
YmVhNWFjOCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgClsgIDQzNy4zOTc1MzldICAgICAgICAgICAgMDAwMDAwMDBiYmY0
ZTUxNjogZDIwZjgwMDA2MDAwICAgICAgICBtdmMgICAgIDAoMTYsJXI4IAopLDAoJXI2KSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKWyAgNDM3LjM5NzUzOV0gICAgICAgICAgICAwMDAwMDAwMGJiZjRlNTFjOiBk
MjA3ODAxMDYwMTAgICAgICAgIG12YyAgICAgMTYoOCwlcjggCiksMTYoJXI2KSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIApbICA0MzcuMzk3NTU2XSBDYWxsIFRyYWNlOiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKWyAgNDM3LjM5NzU1OV0gIFs8MDAwMDAwMDBi
YmY0ZTUwOD5dIGNvbGxlY3RfcGVyY3B1X3RpbWVzKzB4ZDAvMHgyNDAgICAgICAgICAgICAgClsg
IDQzNy4zOTc1NjFdIChbPDAwMDAwMDAwYmJmNGU0Yzg+XSBjb2xsZWN0X3BlcmNwdV90aW1lcysw
eDkwLzB4MjQwKSAgICAgICAgICAgIApbICA0MzcuMzk3NTYzXSAgWzwwMDAwMDAwMGJiZjRmMzgw
Pl0gcHNpX3Nob3crMHg2OC8weDFjMCAgICAgICAgICAgICAgICAgICAgICAgICAKWyAgNDM3LjM5
NzU2OF0gIFs8MDAwMDAwMDBiYzE3NDk0Yz5dIHNlcV9yZWFkKzB4ZTQvMHg0ZDggICAgICAgICAg
ICAgICAgICAgICAgICAgClsgIDQzNy4zOTc1NzJdICBbPDAwMDAwMDAwYmMxNDJkYzQ+XSB2ZnNf
cmVhZCsweDk0LzB4MTYwICAgICAgICAgICAgICAgICAgICAgICAgIApbICA0MzcuMzk3NTczXSAg
WzwwMDAwMDAwMGJjMTQzMWEwPl0ga3N5c19yZWFkKzB4NjgvMHhmOCAgICAgICAgICAgICAgICAg
ICAgICAgICAKWyAgNDM3LjM5NzU3OF0gIFs8MDAwMDAwMDBiYzc1ZDY2OD5dIHN5c3RlbV9jYWxs
KzB4ZGMvMHgyYzggICAgICAgICAgICAgICAgICAgICAgClsgIDQzNy4zOTc1NzldIExhc3QgQnJl
YWtpbmctRXZlbnQtQWRkcmVzczogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IApbICA0MzcuMzk3NTgwXSAgWzwwMDAwMDAwMGJjNzVlYmE4Pl0gX19zMzkwX2luZGlyZWN0X2p1
bXBfcjE0KzB4MC8weGMgICAgICAgICAgICAKWyAgNDM3LjM5NzU4M10gLS0tWyBlbmQgdHJhY2Ug
NTlhMDlmZmI1Zjk2Y2IyYSBdLS0tICAgICAgICAgICAgICAgIAoKCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

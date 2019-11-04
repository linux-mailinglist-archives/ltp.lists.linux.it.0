Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB84EE15A
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 14:36:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 833F43C2437
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Nov 2019 14:36:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 2B5113C2356
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 14:36:00 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 64D19200B3B
 for <ltp@lists.linux.it>; Mon,  4 Nov 2019 14:35:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572874556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPy70Kw/HjSMTavaFiQwqQT9FawO2a7L/uSZuHqJiQU=;
 b=QwfWajm8cWCjq3TjMbkANkaYS7nL5NLt9VIQTzDI1fRlMX1gfVi9wxzUHisA8iJAtOZF0u
 2ECRcoISKIqrutUV6kg4TZOKXeDE0cXOGc1IgwQLXmJDhpBS9jZGxKnIMwWIVL7XKkUNgR
 SVLSOMooi9YBvDWCkKVZs4RHxI293MU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-4F934xzQO9KDdZraJIdqIg-1; Mon, 04 Nov 2019 08:35:53 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2860107ACC2;
 Mon,  4 Nov 2019 13:35:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E840226FAF;
 Mon,  4 Nov 2019 13:35:51 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA0AF18095FF;
 Mon,  4 Nov 2019 13:35:51 +0000 (UTC)
Date: Mon, 4 Nov 2019 08:35:51 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: CKI Project <cki-project@redhat.com>, Jaroslav Kysela <jkysela@redhat.com>,
 alsa-devel@alsa-project.org, LTP Mailing List <ltp@lists.linux.it>
Message-ID: <2029139028.10333037.1572874551626.JavaMail.zimbra@redhat.com>
In-Reply-To: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
References: <cki.1210A7ECB0.BD9Q3APV4K@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.4]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.3.9-rc1-dfe283e.cki (stable)
Thread-Index: n/mewoQ8yG2QJ+7KLfbnKocCzfhA1w==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 4F934xzQO9KDdZraJIdqIg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E3?=
 =?utf-8?q?=2E9-rc1-dfe283e=2Ecki_=28stable=29?=
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
Cc: Memory Management <mm-qe@redhat.com>,
 Linux Stable maillist <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gCj4gSGVsbG8sCj4gCj4gV2UgcmFuIGF1
dG9tYXRlZCB0ZXN0cyBvbiBhIHJlY2VudCBjb21taXQgZnJvbSB0aGlzIGtlcm5lbCB0cmVlOgo+
IAo+ICAgICAgICBLZXJuZWwgcmVwbzoKPiAgICAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC1zdGFibGUtcmMuZ2l0Cj4gICAgICAg
ICAgICAgQ29tbWl0OiBkZmUyODNlOWZkYWMgLSBMaW51eCA1LjMuOS1yYzEKPiAKPiBUaGUgcmVz
dWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJlbG93Lgo+IAo+ICAg
ICBPdmVyYWxsIHJlc3VsdDogRkFJTEVEIChzZWUgZGV0YWlscyBiZWxvdykKPiAgICAgICAgICAg
ICAgTWVyZ2U6IE9LCj4gICAgICAgICAgICBDb21waWxlOiBPSwo+ICAgICAgICAgICAgICBUZXN0
czogRkFJTEVECj4gCj4gQWxsIGtlcm5lbCBiaW5hcmllcywgY29uZmlnIGZpbGVzLCBhbmQgbG9n
cyBhcmUgYXZhaWxhYmxlIGZvciBkb3dubG9hZCBoZXJlOgo+IAo+ICAgaHR0cHM6Ly9hcnRpZmFj
dHMuY2tpLXByb2plY3Qub3JnL3BpcGVsaW5lcy8yNjIzODAKPiAKPiBPbmUgb3IgbW9yZSBrZXJu
ZWwgdGVzdHMgZmFpbGVkOgo+IAo+ICAgICB4ODZfNjQ6Cj4gICAgICDinYwgTFRQIGxpdGUKPgoK
Tm90IGEgNS4zIC1zdGFibGUgcmVncmVzc2lvbi4KCkZhaWx1cmUgY29tZXMgZnJvbSB0ZXN0IHRo
YXQgc2FuaXR5IGNoZWNrcyBhbGwgL3Byb2MgZmlsZXMgYnkgZG9pbmcKMWsgcmVhZCBmcm9tIGVh
Y2guIFRoZXJlIGFyZSBjb3VwbGUgaXNzdWVzIGl0IGhpdHMgd3J0LiBzbmRfaGRhXyouCgpFeGFt
cGxlIHJlcHJvZHVjZXI6CiAgZGQgaWY9L3N5cy9rZXJuZWwvZGVidWcvcmVnbWFwL2hkYXVkaW9D
MEQzLWhkYXVkaW8vYWNjZXNzIG9mPW91dC50eHQgY291bnQ9MSBicz0xMDI0IGlmbGFnPW5vbmJs
b2NrCgpJdCdzIHNsb3cgYW5kIHRyaWdnZXJzIHNvZnQgbG9ja3VwcyBbMV0uIEFuZCBpdCBhbHNv
IHJlcXVpcmVzIGxvdApvZiBtZW1vcnksIHRyaWdnZXJpbmcgT09NcyBvbiBzbWFsbGVyIFZNczoK
MHgwMDAwMDAwMDI0ZjA0MzdiLTB4MDAwMDAwMDAxYTMyYjFjOCAxMDczNzQ1OTIwIHNlcV9yZWFk
KzB4MTMxLzB4NDAwIHBhZ2VzPTI2MjE0NCB2bWFsbG9jIHZwYWdlcyBOMD0yNjIxNDQKCkknbSBs
ZWFuaW5nIHRvd2FyZHMgc2tpcHBpbmcgYWxsIHJlZ21hcCBlbnRyaWVzIGluIHRoaXMgdGVzdC4K
Q29tbWVudHMgYXJlIHdlbGNvbWVkLgoKUmVnYXJkcywKSmFuCgpbMV0KWzE1MzQxLjEzNzExNl0g
d2F0Y2hkb2c6IEJVRzogc29mdCBsb2NrdXAgLSBDUFUjMiBzdHVjayBmb3IgMjJzISBbZGQ6NjM2
NTczXQpbMTUzNDEuMTQ0MTQxXSBNb2R1bGVzIGxpbmtlZCBpbjogbmxzX3V0ZjggaXNvZnMgZHVt
bXkgbWluaXggYmluZm10X21pc2MgbmZzdjMgbmZzX2FjbCBuZnMgbG9ja2QgZ3JhY2UgZnNjYWNo
ZSBzY3RwIHJkcyBicmQgdmZhdCBmYXQgYnRyZnMgeG9yIHpzdGRfY29tcHJlc3MgcmFpZDZfcHEg
enN0ZF9kZWNvbXByZXNzIGxvb3AgdHUKbiBpcDZ0YWJsZV9uYXQgaXA2X3RhYmxlcyB4dF9jb25u
dHJhY2sgaXB0YWJsZV9maWx0ZXIgeHRfTUFTUVVFUkFERSB4dF9jb21tZW50IGlwdGFibGVfbmF0
IG5mX25hdCBuZl9jb25udHJhY2sgbmZfZGVmcmFnX2lwdjYgbmZfZGVmcmFnX2lwdjQgdmV0aCBi
cmlkZ2Ugc3RwIGxsYyBvdmVybGF5IGZ1c2Ugc25kX2hkYV9jb2RlY19yCmVhbHRlayBzbmRfaGRh
X2NvZGVjX2dlbmVyaWMgc3VucnBjIGxlZHRyaWdfYXVkaW8gc25kX2hkYV9jb2RlY19oZG1pIHNu
ZF9oZGFfaW50ZWwgc25kX2hkYV9jb2RlYyBlZGFjX21jZV9hbWQga3ZtX2FtZCBzbmRfaGRhX2Nv
cmUgY2NwIHNuZF9od2RlcCBzbmRfcGNtIGt2bSBzbmRfdGltZXIgaXJxYnlwYXNzIGpveWRldiBz
bmQgYwpyY3QxMGRpZl9wY2xtdWwgY3JjMzJfcGNsbXVsIHNvdW5kY29yZSBicm9hZGNvbSBiY21f
cGh5X2xpYiBnaGFzaF9jbG11bG5pX2ludGVsIHNwNTEwMF90Y28gZmFtMTVoX3Bvd2VyIGsxMHRl
bXAgdGczIHdtaV9ibW9mIHBjc3BrciBpMmNfcGlpeDQgYWNwaV9jcHVmcmVxIGlwX3RhYmxlcyB4
ZnMgbGliY3JjMzJjIHJhZGVvbiBhdGEKX2dlbmVyaWMgaTJjX2FsZ29fYml0IHBhdGFfYWNwaSBk
cm1fa21zX2hlbHBlciBmaXJld2lyZV9vaGNpIHR0bSBjcmMzMmNfaW50ZWwgc2VyaW9fcmF3IHBh
dGFfYXRpaXhwIGZpcmV3aXJlX2NvcmUgZHJtIGNyY19pdHVfdCB3bWkgW2xhc3QgdW5sb2FkZWQ6
IGNhbl0KWzE1MzQxLjIyMzYzNV0gQ1BVOiAyIFBJRDogNjM2NTczIENvbW06IGRkIFRhaW50ZWQ6
IEcgICAgICAgICAgICAgTCAgICA1LjMuOS1yYzEtZGZlMjgzZS5ja2kgIzEKWzE1MzQxLjIzMjA3
M10gSGFyZHdhcmUgbmFtZTogQU1EIFBpa2UvUGlrZSwgQklPUyBSUEsxNTA2QSAwOS8wMy8yMDE0
ClsxNTM0MS4yMzg0NjddIFJJUDogMDAxMDpyZWdtYXBfcmVhZGFibGUrMHgxNS8weDYwClsxNTM0
MS4yNDI5OTZdIENvZGU6IDI1IDI4IDAwIDAwIDAwIDc1IDA3IDQ4IDgzIGM0IDEwIDViIDVkIGMz
IGU4IDkyIDA4IGE2IGZmIDY2IDkwIDBmIDFmIDQ0IDAwIDAwIDQ4IDgzIGJmIGIwIDAxIDAwIDAw
IDAwIDc0IDMxIDhiIDk3IDQ4IDAxIDAwIDAwIDwzOT4gZjIgMGYgOTIgYzAgODUgZDIgMGYgOTUg
YzIgMjAgZDAgNzUgMQpkIDQ4IDgzIDdmIDcwIDAwIDc0IDAxIGMzClsxNTM0MS4yNjE3NjVdIFJT
UDogMDAxODpmZmZmYjNiMTAwNjk3ZGM4IEVGTEFHUzogMDAwMDAyODIgT1JJR19SQVg6IGZmZmZm
ZmZmZmZmZmZmMTMKWzE1MzQxLjI2OTMzMF0gUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogZmZm
ZjhkMWE2Mzc3MzQwMCBSQ1g6IDAwMDAwMDAwMDAwMDBiNDEKWzE1MzQxLjI3NjcyM10gUkRYOiAw
MDAwMDAwMDBmZmZmZmZmIFJTSTogMDAwMDAwMDAwZjNiNDEzOSBSREk6IGZmZmY4ZDFhNjM3NzM0
MDAKWzE1MzQxLjI4Mzg1OF0gUkJQOiAwMDAwMDAwMDBmM2I0MTM5IFIwODogMDAwMDAwMDAwMDAw
MDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDAKWzE1MzQxLjI5MDk4OV0gUjEwOiAwMDAwMDAwMDAw
MDAwMDBmIFIxMTogZmZmZjhkMTk5MDFmZmZmZiBSMTI6IDAwMDAwMDAwMDAwMDAwNzkKWzE1MzQx
LjI5ODExNF0gUjEzOiAwMDAwMDAwMDBmM2I0MTM5IFIxNDogMDAwMDAwMDBmZmZmZmZmZiBSMTU6
IDAwMDAwMDAwMDAwMDAwNmUKWzE1MzQxLjMwNTUwMV0gRlM6ICAwMDAwN2Y0ZTA2N2EwNTgwKDAw
MDApIEdTOmZmZmY4ZDFhNmFhODAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMApbMTUz
NDEuMzEzNTgzXSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUw
MDMzClsxNTM0MS4zMTkzMjJdIENSMjogMDAwMDdmNTA4MzY4MmRjMCBDUjM6IDAwMDAwMDAxMjg3
ZGMwMDAgQ1I0OiAwMDAwMDAwMDAwMDQwNmUwClsxNTM0MS4zMjY0NjJdIENhbGwgVHJhY2U6Clsx
NTM0MS4zMjg5MTJdICByZWdtYXBfdm9sYXRpbGUrMHg0Zi8weGEwClsxNTM0MS4zMzI2NjddICBy
ZWdtYXBfYWNjZXNzX3Nob3crMHg3MC8weDEwMApbMTUzNDEuMzM2OTk3XSAgc2VxX3JlYWQrMHhj
ZC8weDQwMApbMTUzNDEuMzQwMjQ3XSAgZnVsbF9wcm94eV9yZWFkKzB4NTcvMHg3MApbMTUzNDEu
MzQzOTk3XSAgdmZzX3JlYWQrMHg5ZC8weDE1MApbMTUzNDEuMzQ3MjMxXSAga3N5c19yZWFkKzB4
NWYvMHhlMApbMTUzNDEuMzUwNDczXSAgZG9fc3lzY2FsbF82NCsweDVmLzB4MWEwClsxNTM0MS4z
NTQxNjZdICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0NC8weGE5ClsxNTM0MS4z
NTkyMTZdIFJJUDogMDAzMzoweDdmNGUwNjY4MjNjMgpbMTUzNDEuMzYyNzk1XSBDb2RlOiBjMCBl
OSBjMiBmZSBmZiBmZiA1MCA0OCA4ZCAzZCBjMiAwZCAwYSAwMCBlOCBiNSBmMSAwMSAwMCAwZiAx
ZiA0NCAwMCAwMCBmMyAwZiAxZSBmYSA2NCA4YiAwNCAyNSAxOCAwMCAwMCAwMCA4NSBjMCA3NSAx
MCAwZiAwNSA8NDg+IDNkIDAwIGYwIGZmIGZmIDc3IDU2IGMzIDBmIDFmIDQ0IDAwIDAKMCA0OCA4
MyBlYyAyOCA0OCA4OSA1NCAyNApbMTUzNDEuMzgxODUyXSBSU1A6IDAwMmI6MDAwMDdmZmM2YWQz
MGU4OCBFRkxBR1M6IDAwMDAwMjQ2IE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAwMDAwClsxNTM0MS4z
ODk0MjddIFJBWDogZmZmZmZmZmZmZmZmZmZkYSBSQlg6IDAwMDAwMDAwMDAwMDA0MDAgUkNYOiAw
MDAwN2Y0ZTA2NjgyM2MyClsxNTM0MS4zOTY1NjhdIFJEWDogMDAwMDAwMDAwMDAwMDQwMCBSU0k6
IDAwMDA1NjFiYzY5ZjAwMDAgUkRJOiAwMDAwMDAwMDAwMDAwMDAwClsxNTM0MS40MDM5NzldIFJC
UDogMDAwMDU2MWJjNjlmMDAwMCBSMDg6IDAwMDA1NjFiYzY5ZWZiNjAgUjA5OiAwMDAwMDAwMDAw
MDAwMGMwClsxNTM0MS40MTExMTFdIFIxMDogMDAwMDU2MWJjNjlmMDAwMCBSMTE6IDAwMDAwMDAw
MDAwMDAyNDYgUjEyOiBmZmZmZmZmZmZmZmZmZmZmClsxNTM0MS40MTgyNDRdIFIxMzogMDAwMDAw
MDAwMDAwMDAwMCBSMTQ6IDAwMDAwMDAwMDAwMDAwMDAgUjE1OiBmZmZmZmZmZmZmZmZmZmZmCgoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=

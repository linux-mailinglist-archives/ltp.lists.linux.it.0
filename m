Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7DA135770
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 11:54:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 576B13C2401
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 11:54:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id AEB253C23D8
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 11:54:25 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 35DB81A01447
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 11:54:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578567262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xj1RBqCJuLqTLJ9JZan+tbvGEk21aAJy+Bvr+aps9Bg=;
 b=WYE/J75f6h32lDbhrb76oh2fdYcqsRh7R29OU5FPIvvGtWyCbQRuYayoTG90A2SiWylQZA
 l2HQkKLQc7zKDIWaauYrK5RjlN4KhTm69GvkGMq6msRrBtfPX+Wa21/heM52fYcutNHv/q
 0oQvKHAnb1wg8yaMc9zW7oyAT1E0t7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-dUAs6nLXPJK5zb_aE5iUwQ-1; Thu, 09 Jan 2020 05:54:20 -0500
X-MC-Unique: dUAs6nLXPJK5zb_aE5iUwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B0AC477;
 Thu,  9 Jan 2020 10:54:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3149346;
 Thu,  9 Jan 2020 10:54:19 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id F17B0503AA;
 Thu,  9 Jan 2020 10:54:18 +0000 (UTC)
Date: Thu, 9 Jan 2020 05:54:18 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1271182490.1176308.1578567258902.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200109083752.GA17247@dell5510>
References: <cki.7B6FDEE6C3.9EE0H2AAP8@redhat.com>
 <20200109083752.GA17247@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.2]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.4.9-rc1-3abd3b2.cki (stable)
Thread-Index: WQLcQhjngX7pyFD5fpPkGIltY8Fr1A==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E4?=
 =?utf-8?q?=2E9-rc1-3abd3b2=2Ecki_=28stable=29?=
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
Cc: Linux Stable maillist <stable@vger.kernel.org>,
 Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>,
 CKI Project <cki-project@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gSGksCj4gCj4gPiBPbmUgb3IgbW9yZSBr
ZXJuZWwgdGVzdHMgZmFpbGVkOgo+IAo+ID4gICAgIHBwYzY0bGU6Cj4gPiAgICAgIOKdjCBMVFAK
PiBJdCdkIGJlIG5pY2UgaWYgdGhlcmUgd2VyZSBpbmZvIHdoaWNoIExUUCB0ZXN0cyBmYWlsZWQg
KG9yIGV2ZW4gZGlyZWN0IGxpbmsKPiB0bwo+IGZpbGVzIHdoaWNoIGhhcyB0aGUgZmFpbHVyZSku
Cj4gVGhlcmUgYXJlIDIwIGZpbGVzIHJlbGF0ZWQgdG8gTFRQIGZvciBwcGM2NGxlLgo+IAo+IE5v
dGhpbmcgaW4gZG1lc2csIGdyZXAgZm9yIHVzdWFsIExUUCBlcnJvcnMgZGlkbid0IGZpbmQgYW55
dGhpbmcKPiBncmVwIC1yIC1lIEZBSUwgLWUgVEZBSUwgLWUgVEJST0sgLWUgQlJPSyB8Z3JlcCAt
diAnRkFJTEVEIENPTU1BTkQgRmlsZTonCgpObyB0ZXN0cyBmYWlsZWQsIGJ1dCB0aGVyZSB3YXMg
YSBzb2Z0IGxvY2t1cDoKICBodHRwczovL2FydGlmYWN0cy5ja2ktcHJvamVjdC5vcmcvcGlwZWxp
bmVzLzM3MTA3NC9sb2dzL3BwYzY0bGVfaG9zdF8xX0xUUF9kbWVzZy5sb2cKClsgNzM5NC41MzYw
MDBdIExUUDogc3RhcnRpbmcgZGlvMzAgKGRpb3Rlc3Q2IC1iIDY1NTM2IC1uIDEwMCAtaSAxMDAg
LW8gMTAyNDAwMCkKWyA3ODI5Ljc1NDU0M10gd2F0Y2hkb2c6IEJVRzogc29mdCBsb2NrdXAgLSBD
UFUjNSBzdHVjayBmb3IgMjRzISBbc3lzdGVtZC1qb3VybmFsOjUxMF0KWyA3ODYxLjEzODU2OV0g
cmN1OiBJTkZPOiByY3Vfc2NoZWQgZGV0ZWN0ZWQgc3RhbGxzIG9uIENQVXMvdGFza3M6ClsgNzg3
MS4xMTE0NzhdIE1vZHVsZXMgbGlua2VkIGluOiBkdW1teSBtaW5peCBiaW5mbXRfbWlzYyBuZnN2
MyBuZnNfYWNsIG5mcyBsb2NrZCBncmFjZSBmc2NhY2hlClsgNzg3MS4xMTIyODNdIHJjdTogCTUt
Li4uMDogKDkxMiB0aWNrcyB0aGlzIEdQKSBpZGxlPTBmNi8xLzB4NDAwMDAwMDAwMDAwMDAwMiBz
b2Z0aXJxPTMzMzc3NC8zMzM3NzQgZnFzPTI5MjQgClsgNzg3MS4xMTIyODRdICBzY3RwIHJkcyBi
cmQgdmZhdCBmYXQgYnRyZnMgeG9yIHpzdGRfY29tcHJlc3MgcmFpZDZfcHEgenN0ZF9kZWNvbXBy
ZXNzIGxvb3AgdHVuIGlwNnRhYmxlX25hdCBpcDZfdGFibGVzIHh0X2Nvbm50cmFjayBpcHRhYmxl
X2ZpbHRlciB4dF9NQVNRVUVSQURFIHh0X2NvbW1lbnQgaXB0YWJsZV9uYXQgbmZfbmF0IG5mX2Nv
bm50cmFjayBuZl9kZWZyYWdfaXB2NiBuZl9kZWZyYWdfaXB2NCB2ZXRoIGJyaWRnZSBzdHAgbGxj
IG92ZXJsYXkgZnVzZSByZmtpbGwgc3VucnBjIHZteF9jcnlwdG8gdmlydGlvX25ldCBuZXRfZmFp
bG92ZXIgZmFpbG92ZXIgdmlydGlvX2JhbGxvb24gY3JjdDEwZGlmX3ZwbXN1bSBpcF90YWJsZXMg
eGZzIGxpYmNyYzMyYyBjcmMzMmNfdnBtc3VtIHZpcnRpb19jb25zb2xlIHZpcnRpb19ibGsgW2xh
c3QgdW5sb2FkZWQ6IGNhbl0KWyA3ODcxLjEzOTg4MF0gCShkZXRlY3RlZCBieSA0LCB0PTcwMDIg
amlmZmllcywgZz00NDkyMjksIHE9NTI1KQpbIDc4NzEuMTQwMDU2XSBDUFU6IDUgUElEOiA1MTAg
Q29tbTogc3lzdGVtZC1qb3VybmFsIE5vdCB0YWludGVkIDUuNC45LXJjMS0zYWJkM2IyLmNraSAj
MQpbIDc4ODIuMDM4NDE1XSBTZW5kaW5nIE5NSSBmcm9tIENQVSA0IHRvIENQVXMgNToKWyA3ODgy
LjAzODYwOF0gTklQOiAgYzAwMDAwMDAwMDAwYjAxYyBMUjogYzAwMDAwMDAwMDAxYmJkNCBDVFI6
IGMwMDAwMDAwMDA4Mjg4NDAKWyA3ODgyLjAzOTAxOF0gUkVHUzogYzAwMDAwMDNlZWRkYjdjMCBU
UkFQOiAwOTAxICAgTm90IHRhaW50ZWQgICg1LjQuOS1yYzEtM2FiZDNiMi5ja2kpClsgNzg4Mi4w
MzkxNTVdIE1TUjogIDgwMDAwMDAwMDAwMDkwMzMgPFNGLEVFLE1FLElSLERSLFJJLExFPiAgQ1I6
IDQ4MDA0NDRmICBYRVI6IDAwMDAwMDAwClsgNzg4Mi4wMzkzNTRdIENGQVI6IGMwMDAwMDAwMDAw
ZTk1NjQgSVJRTUFTSzogMCAKICAgICAgICAgICAgICAgR1BSMDA6IGMwMDAwMDAwMDBkNzgwNzAg
YzAwMDAwMDNlZWRkYmE1MCBjMDAwMDAwMDAxODBmZTAwIDAwMDAwMDAwMDAwMDA5MDAgCiAgICAg
ICAgICAgICAgIEdQUjA0OiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgNWIyMDM3
MzgzMDMwMmUzOCBjMDAwMDAwMDNmZmY4YTAwIAogICAgICAgICAgICAgICBHUFIwODogMDAwMDAw
MDgwMDAwMDAwMCBjMDAwMDAwM2Y5ZWIyN2Q4IGMwMDAwMDAzZjllYjI3ZTAgYzAwMDAwMDNmYjAx
ZWEwMCAKICAgICAgICAgICAgICAgR1BSMTI6IGMwMDAwMDAwMDA4Mjg4NDAgYzAwMDAwMDAzZmZm
OGEwMCAKWyA3ODgyLjA0MDA0Ml0gTklQIFtjMDAwMDAwMDAwMDBiMDFjXSByZXBsYXlfaW50ZXJy
dXB0X3JldHVybisweDAvMHg0ClsgNzg4Mi4wNDAxNzddIExSIFtjMDAwMDAwMDAwMDFiYmQ0XSBh
cmNoX2xvY2FsX2lycV9yZXN0b3JlLnBhcnQuMCsweDU0LzB4NzAKWyA3ODgyLjA0MDMwM10gQ2Fs
bCBUcmFjZToKWyA3ODgyLjA0MDQzOV0gW2MwMDAwMDAzZWVkZGJhNTBdIFtjMDAwMDAwM2VlZGRi
YTkwXSAweGMwMDAwMDAzZWVkZGJhOTAgKHVucmVsaWFibGUpClsgNzg4Mi4wNDA2NzVdIFtjMDAw
MDAwM2VlZGRiYTcwXSBbYzAwMDAwMDAwMGQ3ODA3MF0gX3Jhd19zcGluX3VubG9ja19pcnFyZXN0
b3JlKzB4NTAvMHhiMApbIDc4ODIuMDQwOTc0XSBbYzAwMDAwMDNlZWRkYmE5MF0gW2MwMDAwMDAw
MDA4MmI1OGNdIGh2Y193cml0ZSsweGZjLzB4MjQwClsgNzg4Mi4wNDExNDNdIFtjMDAwMDAwM2Vl
ZGRiYWYwXSBbYzAwMDAwMDAwMDgwMWU1MF0gbl90dHlfd3JpdGUrMHgxOTAvMHg2NjAKWyA3ODgy
LjA0MTMxNl0gW2MwMDAwMDAzZWVkZGJiYzBdIFtjMDAwMDAwMDAwN2ZjNjdjXSB0dHlfd3JpdGUr
MHgxOWMvMHgzMjAKWyA3ODg3Ljc4NTQzN10gQ1BVIDUgZGlkbid0IHJlc3BvbmQgdG8gYmFja3Ry
YWNlIElQSSwgaW5zcGVjdGluZyBwYWNhLgpbIDc4ODguMjkyNjQ3XSBbYzAwMDAwMDNlZWRkYmM4
MF0gW2MwMDAwMDAwMDA0NTg4NWNdIGRvX2l0ZXJfd3JpdGUrMHgxYWMvMHgyODAKWyA3ODg4LjI5
Mjc1NV0gaXJxX3NvZnRfbWFzazogMHgwMSBpbl9tY2U6IDAgaW5fbm1pOiAwIGN1cnJlbnQ6IDUx
MCAoc3lzdGVtZC1qb3VybmFsKQpbIDc4ODguMjkyOTI0XSBbYzAwMDAwMDNlZWRkYmNkMF0gW2Mw
MDAwMDAwMDA0NThhMjBdIHZmc193cml0ZXYrMHhjMC8weDE3MApbIDc4ODguMzIxNzY1XSBCYWNr
IHRyYWNlIG9mIHBhY2EtPnNhdmVkX3IxICgweGMwMDAwMDAzZWVkZGIxNjApIChwb3NzaWJseSBz
dGFsZSk6ClsgNzg4OC4zMjE4OTddIFtjMDAwMDAwM2VlZGRiZGMwXSBbYzAwMDAwMDAwMDQ1OGI2
MF0gZG9fd3JpdGV2KzB4OTAvMHgxYTAKWyA3ODg4LjM2Njk4M10gQ2FsbCBUcmFjZToKWyA3ODg4
LjM2NzEwM10gW2MwMDAwMDAzZWVkZGJlMjBdIFtjMDAwMDAwMDAwMDBiOWQwXSBzeXN0ZW1fY2Fs
bCsweDVjLzB4NjgKWyA3ODg4LjM2NzE0M10gW2MwMDAwMDAzZWVkZGIxNjBdIFswMDAwMDAwMDAw
MDAwMDAxXSAweDEgKHVucmVsaWFibGUpClsgNzg4OC4zNjcyMzZdIEluc3RydWN0aW9uIGR1bXA6
ClsgNzg4OC4zNjc0MDldIHJjdTogcmN1X3NjaGVkIGt0aHJlYWQgc3RhcnZlZCBmb3IgMjcyNCBq
aWZmaWVzISBnNDQ5MjI5IGYweDAgUkNVX0dQX1dBSVRfRlFTKDUpIC0+c3RhdGU9MHg0MDIgLT5j
cHU9NApbIDc4ODguMzY3NDQ5XSA3ZDIwMDAyNiA2MThjODAwMCAyYzAzMDkwMCA0MTgyZTJlOCAy
YzAzMDUwMCA0MTgyZGM0MCAyYzAzMGYwMCA0MTgyZjJiOCAKWyA3ODg4LjM5NjQ1OV0gcmN1OiBS
Q1UgZ3JhY2UtcGVyaW9kIGt0aHJlYWQgc3RhY2sgZHVtcDoKWyA3ODg4LjM5NjU5OV0gMmMwMzBh
MDAgNDE4MmZmYzggNjAwMDAwMDAgNjAwMDAwMDAgPDRlODAwMDIwPiA3Yzc4MWI3OCA0ODAwMDM0
OSA0ODAwMDM2MSAKWyA3ODg4LjM5NjcyNF0gcmN1X3NjaGVkICAgICAgIEkgICAgMCAgICAxMCAg
ICAgIDIgMHgwMDAwMDgwOApbIDc4ODguMzk2OTQzXSBDYWxsIFRyYWNlOgpbIDc4ODguMzk3MDEy
XSBbYzAwMDAwMDNmYjVmZjg4MF0gW2MwMDAwMDAzZmViOTZiMDBdIDB4YzAwMDAwMDNmZWI5NmIw
MCAodW5yZWxpYWJsZSkKWyA3ODg4LjM5NzE3NF0gW2MwMDAwMDAzZmI1ZmZhNjBdIFtjMDAwMDAw
MDAwMDIxZjRjXSBfX3N3aXRjaF90bysweDMzYy8weDUwMApbIDc4ODguMzk3Mjg5XSBbYzAwMDAw
MDNmYjVmZmFjMF0gW2MwMDAwMDAwMDBkNzA0ZjhdIF9fc2NoZWR1bGUrMHgyYzgvMHg4ZjAKWyA3
ODg4LjM5NzQxMF0gW2MwMDAwMDAzZmI1ZmZiOTBdIFtjMDAwMDAwMDAwZDcwYjc4XSBzY2hlZHVs
ZSsweDU4LzB4MTMwClsgNzg4OC4zOTc1MjBdIFtjMDAwMDAwM2ZiNWZmYmMwXSBbYzAwMDAwMDAw
MGQ3Njc0NF0gc2NoZWR1bGVfdGltZW91dCsweDFhNC8weDNjMApbIDc4ODguMzk3Njc2XSBbYzAw
MDAwMDNmYjVmZmNhMF0gW2MwMDAwMDAwMDAxZGU2MDhdIHJjdV9ncF9rdGhyZWFkKzB4OWI4LzB4
ZDgwClsgNzg4OC4zOTc4NzFdIFtjMDAwMDAwM2ZiNWZmZGIwXSBbYzAwMDAwMDAwMDE2ZjUwNF0g
a3RocmVhZCsweDFhNC8weDFiMApbIDc4ODguMzk4MDQwXSBbYzAwMDAwMDNmYjVmZmUyMF0gW2Mw
MDAwMDAwMDAwMGJkYmNdIHJldF9mcm9tX2tlcm5lbF90aHJlYWQrMHg1Yy8weDgwCgoKLS0gCk1h
aWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

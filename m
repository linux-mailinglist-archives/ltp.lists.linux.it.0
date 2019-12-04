Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D642C112451
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 09:18:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A15F3C250D
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Dec 2019 09:18:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 9F31D3C23DF
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 09:18:31 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 28574601890
 for <ltp@lists.linux.it>; Wed,  4 Dec 2019 09:18:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575447509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kln9bTRM88rOH9XNgyOqW2POVap1DkdUcpikqALovvg=;
 b=Sza4HKnBtz2HUphC01nczo4xsSkpG7/vI9orv6t0+XvTGwMz6aw7JDGO3/gS/mvu7fDbZ/
 5jxtm15oedpeYR85P8vaeWz6p1+mckgS2uPHS0UeXoe/1iKjHeaO5zH7gw4mw1GlQbC1IX
 mMMtlYtiBxhbTksfKjvIvi0V/ubx1dQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-CxSctQxENd25Qf7T29R53w-1; Wed, 04 Dec 2019 03:18:27 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC87D800D4C;
 Wed,  4 Dec 2019 08:18:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B49E85C1B0;
 Wed,  4 Dec 2019 08:18:26 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B32E5BC03;
 Wed,  4 Dec 2019 08:18:26 +0000 (UTC)
Date: Wed, 4 Dec 2019 03:18:26 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: CKI Project <cki-project@redhat.com>
Message-ID: <2014617876.14947317.1575447506379.JavaMail.zimbra@redhat.com>
In-Reply-To: <cki.E29F90E1D2.DNJBK7BQCI@redhat.com>
References: <cki.E29F90E1D2.DNJBK7BQCI@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.21]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.3.14-a8a1bb9.cki (stable-queue)
Thread-Index: gVawCuvmigoaW2KLXrng0YJd6pk3Qg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: CxSctQxENd25Qf7T29R53w-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E3?=
 =?utf-8?q?=2E14-a8a1bb9=2Ecki_=28stable-queue=29?=
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
Cc: Memory Management <mm-qe@redhat.com>, LTP Mailing List <ltp@lists.linux.it>,
 Linux Stable maillist <stable@vger.kernel.org>,
 William Gomeringer <wgomeringer@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiAKPiBIZWxsbywKPiAKPiBXZSByYW4gYXV0
b21hdGVkIHRlc3RzIG9uIGEgcmVjZW50IGNvbW1pdCBmcm9tIHRoaXMga2VybmVsIHRyZWU6Cj4g
Cj4gICAgICAgIEtlcm5lbCByZXBvOgo+ICAgICAgICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL3N0YWJsZS1xdWV1ZS5naXQKPiAgICAgICAgICAg
ICBDb21taXQ6IGE4YTFiYjliNjMxNSAtIHBsYXRmb3JtL3g4NjogaHAtd21pOiBGaXggQUNQSSBl
cnJvcnMKPiAgICAgICAgICAgICBjYXVzZWQgYnkgcGFzc2luZyAwIGFzIGlucHV0IHNpemUKPiAK
PiBUaGUgcmVzdWx0cyBvZiB0aGVzZSBhdXRvbWF0ZWQgdGVzdHMgYXJlIHByb3ZpZGVkIGJlbG93
Lgo+IAo+ICAgICBPdmVyYWxsIHJlc3VsdDogRkFJTEVEIChzZWUgZGV0YWlscyBiZWxvdykKPiAg
ICAgICAgICAgICAgTWVyZ2U6IE9LCj4gICAgICAgICAgICBDb21waWxlOiBPSwo+ICAgICAgICAg
ICAgICBUZXN0czogRkFJTEVECj4gCj4gQWxsIGtlcm5lbCBiaW5hcmllcywgY29uZmlnIGZpbGVz
LCBhbmQgbG9ncyBhcmUgYXZhaWxhYmxlIGZvciBkb3dubG9hZCBoZXJlOgo+IAo+ICAgaHR0cHM6
Ly9hcnRpZmFjdHMuY2tpLXByb2plY3Qub3JnL3BpcGVsaW5lcy8zMjIwODkKPiAKPiBPbmUgb3Ig
bW9yZSBrZXJuZWwgdGVzdHMgZmFpbGVkOgo+IAo+ICAgICB4ODZfNjQ6Cj4gICAgICDinYwgTFRQ
Cj4gICAgICDinYwgQm9vdCB0ZXN0Cj4gICAgICDinYwgQm9vdCB0ZXN0Cj4gCgpCb290IHRlc3Rz
IGxvb2sgbGlrZSBmYWxzZSBwb3NpdGl2ZXMuIExUUCBoaXQga2VybmVsIG9vcHM6CiAgaHR0cHM6
Ly9hcnRpZmFjdHMuY2tpLXByb2plY3Qub3JnL3BpcGVsaW5lcy8zMjIwODkvbG9ncy94ODZfNjRf
aG9zdF8xX2NvbnNvbGUubG9nCgpbIDI0MTguNzM5NDQwXSBMVFA6IHN0YXJ0aW5nIHJlcXVlc3Rf
a2V5MDEgClsgMjQxOC43NDI3OTldIExUUDogc3RhcnRpbmcgcmVxdWVzdF9rZXkwMiAKWyAyNDIw
Ljc0OTA0Ml0gTFRQOiBzdGFydGluZyByZXF1ZXN0X2tleTAzIApbIDI0MjAuNzUxNjM1XSBlbmNy
eXB0ZWRfa2V5OiBrZXl3b3JkICd1cGRhdGUnIG5vdCBhbGxvd2VkIHdoZW4gY2FsbGVkIGZyb20g
Lmluc3RhbnRpYXRlIG1ldGhvZCAKWyAyNDIwLjg3NzA5MF0gZW5jcnlwdGVkX2tleToga2V5d29y
ZCAndXBkYXRlJyBub3QgYWxsb3dlZCB3aGVuIGNhbGxlZCBmcm9tIC5pbnN0YW50aWF0ZSBtZXRo
b2QgClsgMjQyMC44Nzk3MDBdIGVuY3J5cHRlZF9rZXk6IGtleXdvcmQgJ3VwZGF0ZScgbm90IGFs
bG93ZWQgd2hlbiBjYWxsZWQgZnJvbSAuaW5zdGFudGlhdGUgbWV0aG9kIAouLi4KWyAyNDIxLjE0
NzY1OV0gZ2VuZXJhbCBwcm90ZWN0aW9uIGZhdWx0OiAwMDAwIFsjMV0gU01QIFBUSSAKWyAyNDIx
LjE0ODg4NF0gQ1BVOiAwIFBJRDogNDM5ODE0IENvbW06IHJlcXVlc3Rfa2V5MDMgVGFpbnRlZDog
RyAgICAgICAgVyAgICAgICAgIDUuMy4xNC1hOGExYmI5LmNraSAjMSAKWyAyNDIxLjE1MDkxNl0g
SGFyZHdhcmUgbmFtZTogUmVkIEhhdCBLVk0sIEJJT1MgMC41LjEgMDEvMDEvMjAxMSAKWyAyNDIx
LjE1MjE5OV0gUklQOiAwMDEwOmttZW1fY2FjaGVfYWxsb2MrMHg3NS8weDIyMCAKWyAyNDIxLjE1
MzI0NF0gQ29kZTogMDEgMDAgMDAgNGMgOGIgNDUgMDAgNjUgNDkgOGIgNTAgMDggNjUgNGMgMDMg
MDUgZDkgZWYgZDQgNGIgNGQgOGIgMjAgNGQgODUgZTQgMGYgODQgNzEgMDEgMDAgMDAgOGIgNWQg
MjAgNDggOGIgN2QgMDAgNGMgMDEgZTMgPDQ4PiAzMyAxYiA0OCAzMyA5ZCA3MCAwMSAwMCAwMCA0
MCBmNiBjNyAwZiAwZiA4NSA2ZSAwMSAwMCAwMCA0OCA4ZCAKWyAyNDIxLjE1NzM3MF0gUlNQOiAw
MDE4OmZmZmZhMjJhODBhZTNkMzAgRUZMQUdTOiAwMDAxMDI4MiAKWyAyNDIxLjE1ODUzMF0gUkFY
OiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogYmI4NmQwZWI1M2FhNjM2NyBSQ1g6IDAwMDAwMDAwMDAw
MDAzZjkgClsgMjQyMS4xNjAxMDhdIFJEWDogMDAwMDAwMDAwMDAxY2RhZCBSU0k6IDAwMDAwMDAw
MDAwMDBkYzAgUkRJOiAwMDAwMDAwMDAwMDJkNjgwIApbIDI0MjEuMTYxNjc1XSBSQlA6IGZmZmY4
ZDdjM2IwMWFlMDAgUjA4OiBmZmZmOGQ3YzNiYTJkNjgwIFIwOTogMDAwMDAwMDAzZjAxMDAwMCAK
WyAyNDIxLjE2MzI3NV0gUjEwOiAwMDAwMDAwMDAwMDAwMDA0IFIxMTogMDAwMDAwMDA2MzczNjU2
NCBSMTI6IGJiODZkMGViNTNhYTYzNjcgClsgMjQyMS4xNjQ4NTRdIFIxMzogMDAwMDAwMDAwMDAw
MGRjMCBSMTQ6IGZmZmZmZmZmYjQ0MjQ0N2IgUjE1OiBmZmZmOGQ3YzNiMDFhZTAwIApbIDI0MjEu
MTY2NDQ5XSBGUzogIDAwMDA3ZjBjZTUzNjg2MDAoMDAwMCkgR1M6ZmZmZjhkN2MzYmEwMDAwMCgw
MDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwIApbIDI0MjEuMTY4MjI1XSBDUzogIDAwMTAgRFM6
IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzIApbIDI0MjEuMTY5NTA4XSBDUjI6
IDAwMDA3ZmIzZTU5ZjgzODAgQ1IzOiAwMDAwMDAwMTM5NzJlMDA1IENSNDogMDAwMDAwMDAwMDc2
MDZmMCAKWyAyNDIxLjE3MTA3M10gRFIwOiAwMDAwMDAwMDAwMDAwMDAwIERSMTogMDAwMDAwMDAw
MDAwMDAwMCBEUjI6IDAwMDAwMDAwMDAwMDAwMDAgClsgMjQyMS4xNzI2NjBdIERSMzogMDAwMDAw
MDAwMDAwMDAwMCBEUjY6IDAwMDAwMDAwZmZmZTBmZjAgRFI3OiAwMDAwMDAwMDAwMDAwNDAwIApb
IDI0MjEuMTc0MjIyXSBQS1JVOiA1NTU1NTU1NCAKWyAyNDIxLjE3NDg1MV0gQ2FsbCBUcmFjZTog
ClsgMjQyMS4xNzU0MTBdICBrZXlfYWxsb2MrMHgxMmIvMHg0NTAgClsgMjQyMS4xNzYxNzVdICBy
ZXF1ZXN0X2tleV9hbmRfbGluaysweDI1Ni8weDZhMCAKWyAyNDIxLjE3NzE0Nl0gID8ga2V5cmlu
Z19hbGxvYysweDcwLzB4NzAgClsgMjQyMS4xNzgwMDVdICA/IGtleV9kZWZhdWx0X2NtcCsweDIw
LzB4MjAgClsgMjQyMS4xNzg4ODJdICBfX3g2NF9zeXNfcmVxdWVzdF9rZXkrMHhmNC8weDE5MCAK
WyAyNDIxLjE3OTg1Nl0gIGRvX3N5c2NhbGxfNjQrMHg1Zi8weDFhMCAKWyAyNDIxLjE4MDY5NV0g
IGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkgClsgMjQyMS4xODE4MTRd
IFJJUDogMDAzMzoweDdmMGNlNTI5YTFhZCAKWyAyNDIxLjE4MjYyNF0gQ29kZTogMDAgYzMgNjYg
MmUgMGYgMWYgODQgMDAgMDAgMDAgMDAgMDAgOTAgZjMgMGYgMWUgZmEgNDggODkgZjggNDggODkg
ZjcgNDggODkgZDYgNDggODkgY2EgNGQgODkgYzIgNGQgODkgYzggNGMgOGIgNGMgMjQgMDggMGYg
MDUgPDQ4PiAzZCAwMSBmMCBmZiBmZiA3MyAwMSBjMyA0OCA4YiAwZCBhYiA1YyAwYyAwMCBmNyBk
OCA2NCA4OSAwMSA0OCAKWyAyNDIxLjE4Njc0OV0gUlNQOiAwMDJiOjAwMDA3ZmZmNjFiNzdhZjgg
RUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDogMDAwMDAwMDAwMDAwMDBmOSAKWyAyNDIxLjE4ODQw
N10gUkFYOiBmZmZmZmZmZmZmZmZmZmRhIFJCWDogMDAwMDdmMGNlNTM2ODU4MCBSQ1g6IDAwMDA3
ZjBjZTUyOWExYWQgClsgMjQyMS4xODk5OTRdIFJEWDogMDAwMDAwMDAwMDQxMzJlMiBSU0k6IDAw
MDAwMDAwMDA0MTMyYzUgUkRJOiAwMDAwMDAwMDAwNDEzMzY3IApbIDI0MjEuMTkxNTc2XSBSQlA6
IDAwMDAwMDAwMjY0N2QwNjkgUjA4OiAwMDAwMDAwMDAwMDAwMDAwIFIwOTogMDAwMDAwMDAwMDAw
MDAwMCAKWyAyNDIxLjE5MzE0NV0gUjEwOiAwMDAwMDAwMGZmZmZmZmZkIFIxMTogMDAwMDAwMDAw
MDAwMDI0NiBSMTI6IDAwMDAwMDAwMDAwNmI2MDUgClsgMjQyMS4xOTQ3MzBdIFIxMzogMDAwMDAw
MDAwMDQxMzM2NyBSMTQ6IDAwMDAwMDAwMDAwMTg2YTAgUjE1OiAwMDAwMDAwMDAwMDA0M2ZiIAo8
Zm9sbG93ZWQgYnkgbW9yZSBjYWxsIHRyYWNlcz4KCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==

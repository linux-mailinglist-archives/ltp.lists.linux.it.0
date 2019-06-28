Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E3F59901
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jun 2019 13:09:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCA6A3C1C81
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Jun 2019 13:09:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 420853C094C
 for <ltp@lists.linux.it>; Fri, 28 Jun 2019 13:09:39 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4E7761001729
 for <ltp@lists.linux.it>; Fri, 28 Jun 2019 13:09:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8FADE2F8BE3;
 Fri, 28 Jun 2019 11:09:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8588619C70;
 Fri, 28 Jun 2019 11:09:36 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7BDDF54D3C;
 Fri, 28 Jun 2019 11:09:36 +0000 (UTC)
Date: Fri, 28 Jun 2019 07:09:33 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Song Hongzhi <hongzhi.song@windriver.com>, ltp@lists.linux.it
Message-ID: <1731168043.30655111.1561720172996.JavaMail.zimbra@redhat.com>
In-Reply-To: <dc4e1e30-face-9039-db90-5a6dae2fc2ea@windriver.com>
References: <dc4e1e30-face-9039-db90-5a6dae2fc2ea@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.16]
Thread-Topic: Bug Report: diotest4 fails on mips64
Thread-Index: Kvwh14Q3CYZZ0EFxR6qt4m+bMyERyg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 28 Jun 2019 11:09:36 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Bug Report: diotest4 fails on mips64
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgotLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gKkx0cDoqCj4gCj4gbGF0ZXN0IG1hc3Rl
cgo+IAo+IAo+ICpLZXJuZWw6Kgo+IAo+IEFmdGVyIHY1LjEgQVJDSD1taXBzNjQKPiAKPiAKPiAq
RXJyb3IgaW5mbzoqCj4gCj4gZGlvdGVzdDQgMTAgVEJST0sgOiBkaW90ZXN0NC5jOjM2ODogY2Fu
J3QgbW1hcCBmaWxlOiBJbnZhbGlkIGFyZ3VtZW50Cj4gZGlvdGVzdDQgMTEgVEJST0sgOiBkaW90
ZXN0NC5jOjM2ODogUmVtYWluaW5nIGNhc2VzIGJyb2tlbgo+IAo+IAo+IEkgdGhpbmsgdGhlIGZp
cnN0IGFyZ3VtZW50IG9mIG1tYXAgaXMgaW52YWxpZC4KPiAKPiAgwqDCoCA+c2htX2Jhc2UgPSAo
Y2hhciAqKSgoKGxvbmcpc2JyaygwKSArIChzaG1zeiAtIDEpKSAmIH4oc2htc3ogLSAxKSk7Cj4g
Cj4gIMKgwqAgPnNobV9iYXNlID0gbW1hcChzaG1fYmFzZSwgMHgxMDAwMDAsIFBST1RfUkVBRCB8
IFBST1RfV1JJVEUsCgpJIGRvbid0IHNlZSBhbnkgbm90ZSB3aHkgdGhhdCBtbWFwIG5lZWRzIHRv
IGJlIE1BUF9GSVhFRC4gSSdkIGRyb3AgaXQsCmxldCBrZXJuZWwgcGljayBhbiBhZGRyZXNzOgoK
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvaW8vZGlyZWN0X2lvL2Rpb3Rlc3Q0LmMgYi90
ZXN0Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9pby9kaW90ZXN0NC5jCmluZGV4IGU0NjE2ZTQwMGFi
ZC4uYmYyMDBjZDQxYTI3IDEwMDY0NAotLS0gYS90ZXN0Y2FzZXMva2VybmVsL2lvL2RpcmVjdF9p
by9kaW90ZXN0NC5jCisrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvaW8vZGlyZWN0X2lvL2Rpb3Rlc3Q0
LmMKQEAgLTM1MiwxOCArMzUyLDE0IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10p
CiAgICAgICAgdG90YWwrKzsKCiAgICAgICAgLyogVGVzdC0xMDogcmVhZCwgd3JpdGUgdG8gYSBt
bWFwZWQgZmlsZSAqLwotICAgICAgIHNobV9iYXNlID0gKGNoYXIgKikoKChsb25nKXNicmsoMCkg
KyAoc2htc3ogLSAxKSkgJiB+KHNobXN6IC0gMSkpOwotICAgICAgIGlmIChzaG1fYmFzZSA9PSBO
VUxMKSB7Ci0gICAgICAgICAgICAgICB0c3RfYnJrbShUQlJPSywgY2xlYW51cCwgInNicmsgZmFp
bGVkOiAlcyIsIHN0cmVycm9yKGVycm5vKSk7Ci0gICAgICAgfQogICAgICAgIG9mZnNldCA9IDQw
OTY7CiAgICAgICAgY291bnQgPSBidWZzaXplOwogICAgICAgIGlmICgoZmQgPSBvcGVuKGZpbGVu
YW1lLCBPX0RJUkVDVCB8IE9fUkRXUikpIDwgMCkgewogICAgICAgICAgICAgICAgdHN0X2Jya20o
VEJST0ssIGNsZWFudXAsICJjYW4ndCBvcGVuICVzOiAlcyIsCiAgICAgICAgICAgICAgICAgICAg
ICAgICBmaWxlbmFtZSwgc3RyZXJyb3IoZXJybm8pKTsKICAgICAgICB9Ci0gICAgICAgc2htX2Jh
c2UgPSBtbWFwKHNobV9iYXNlLCAweDEwMDAwMCwgUFJPVF9SRUFEIHwgUFJPVF9XUklURSwKLSAg
ICAgICAgICAgICAgICAgICAgICAgTUFQX1NIQVJFRCB8IE1BUF9GSVhFRCwgZmQsIDApOworICAg
ICAgIHNobV9iYXNlID0gbW1hcCgwLCAweDEwMDAwMCwgUFJPVF9SRUFEIHwgUFJPVF9XUklURSwK
KyAgICAgICAgICAgICAgICAgICAgICAgTUFQX1NIQVJFRCwgZmQsIDApOwogICAgICAgIGlmIChz
aG1fYmFzZSA9PSAoY2FkZHJfdCkgLSAxKSB7CiAgICAgICAgICAgICAgICB0c3RfYnJrbShUQlJP
SywgY2xlYW51cCwgImNhbid0IG1tYXAgZmlsZTogJXMiLAogICAgICAgICAgICAgICAgICAgICAg
ICAgc3RyZXJyb3IoZXJybm8pKTsKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK

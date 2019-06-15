Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEB847281
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Jun 2019 01:08:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B6773EA532
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Jun 2019 01:08:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 245133EA4CD
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 01:08:31 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 83021201614
 for <ltp@lists.linux.it>; Sun, 16 Jun 2019 01:08:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BB62D85539;
 Sat, 15 Jun 2019 23:08:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 915157F49E;
 Sat, 15 Jun 2019 23:08:27 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1172C24B25;
 Sat, 15 Jun 2019 23:08:27 +0000 (UTC)
Date: Sat, 15 Jun 2019 19:08:23 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Sumit Garg <sumit.garg@linaro.org>, chrubis@suse.cz
Message-ID: <1142529550.28348566.1560640103965.JavaMail.zimbra@redhat.com>
In-Reply-To: <1552978181-27748-4-git-send-email-sumit.garg@linaro.org>
References: <1552978181-27748-1-git-send-email-sumit.garg@linaro.org>
 <1552978181-27748-4-git-send-email-sumit.garg@linaro.org>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.60, 10.4.195.17]
Thread-Topic: syscalls/tgkill03: add new test
Thread-Index: d2VHb0WQF/CX+5Wu2dwwblCbo+aBkQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Sat, 15 Jun 2019 23:08:27 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: daniel thompson <daniel.thompson@linaro.org>,
 Greg Hackmann <ghackmann@google.com>, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls/tgkill03: add new test
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
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

Ci0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPiArc3RhdGljIHZvaWQgc2V0dXAodm9pZCkK
PiArewo+ICsJc2lnc2V0X3Qgc2lndXNyMTsKPiArCXB0aHJlYWRfdCBkZWZ1bmN0X3RocmVhZDsK
PiArCj4gKwlzaWdlbXB0eXNldCgmc2lndXNyMSk7Cj4gKwlzaWdhZGRzZXQoJnNpZ3VzcjEsIFNJ
R1VTUjEpOwo+ICsJcHRocmVhZF9zaWdtYXNrKFNJR19CTE9DSywgJnNpZ3VzcjEsIE5VTEwpOwo+
ICsKPiArCXBhcmVudF90Z2lkID0gZ2V0cGlkKCk7Cj4gKwlwYXJlbnRfdGlkID0gc3lzX2dldHRp
ZCgpOwo+ICsKPiArCVNBRkVfUFRIUkVBRF9DUkVBVEUoJmNoaWxkX3RocmVhZCwgTlVMTCwgY2hp
bGRfdGhyZWFkX2Z1bmMsIE5VTEwpOwo+ICsKPiArCVRTVF9DSEVDS1BPSU5UX1dBSVQoMCk7CgpJ
J20gc2VlaW5nIHJlcG9ydHMgb2YgdGhpcyB0ZXN0IGZhaWxpbmcgb24gczM5MHg6CgpzdF90ZXN0
LmM6MTA5NjogSU5GTzogVGltZW91dCBwZXIgcnVuIGlzIDBoIDA1bSAwMHMKdGdraWxsMDMuYzo5
MjogUEFTUzogSW52YWxpZCB0Z2lkIGZhaWxlZCBhcyBleHBlY3RlZDogRUlOVkFMCnRna2lsbDAz
LmM6OTI6IFBBU1M6IEludmFsaWQgdGlkIGZhaWxlZCBhcyBleHBlY3RlZDogRUlOVkFMCnRna2ls
bDAzLmM6OTI6IFBBU1M6IEludmFsaWQgc2lnbmFsIGZhaWxlZCBhcyBleHBlY3RlZDogRUlOVkFM
CnRna2lsbDAzLmM6OTY6IEZBSUw6IERlZnVuY3QgdGlkIHNob3VsZCBoYXZlIGZhaWxlZCB3aXRo
IEVTUkNIOiBTVUNDRVNTCnRna2lsbDAzLmM6OTI6IFBBU1M6IERlZnVuY3QgdGdpZCBmYWlsZWQg
YXMgZXhwZWN0ZWQ6IEVTUkNICnRna2lsbDAzLmM6OTk6IFBBU1M6IFZhbGlkIHRna2lsbCBjYWxs
IHN1Y2NlZWRlZAoKYW5kIEkgc3VzcGVjdCB0aGlzIHBpZWNlOgoKPiArCj4gKwlTQUZFX1BUSFJF
QURfQ1JFQVRFKCZkZWZ1bmN0X3RocmVhZCwgTlVMTCwgZGVmdW5jdF90aHJlYWRfZnVuYywgTlVM
TCk7Cj4gKwo+ICsJU0FGRV9QVEhSRUFEX0pPSU4oZGVmdW5jdF90aHJlYWQsIE5VTEwpOwo+ICt9
CgpnbGliYyBwdGhyZWFkX2pvaW4oKSB3YWl0cyBmb3IgQ0xPTkVfQ0hJTERfQ0xFQVJUSUQgdG8g
Y2xlYXIgdGlkLAphbmQgdGhlbiByZXN1bWVzLiBXaGljaCBrZXJuZWwgZG9lcyBhdDoKICBkb19l
eGl0CiAgICBleGl0X21tCiAgICAgIG1tX3JlbGVhc2UKICAgICAgICBwdXRfdXNlcigwLCB0c2st
PmNsZWFyX2NoaWxkX3RpZCk7CgpzbyB0aGVyZSdzIHN0aWxsIHdvcmsgdG8gYmUgZG9uZSBhZnRl
ciB0aGF0LCBhbmQgSSBzdXNwZWN0IHRpZCBpcyBzdGlsbCB2YWxpZAp3aGlsZSB0aGF0IGhhcHBl
bnMuCgpNeSBmaXJzdCBpZGVhOiB3YWl0IHVudGlsIC9wcm9jL3BpZC90YXNrLzx0aWQ+IGRpc2Fw
cGVhcnMuCgpSZWdhcmRzLApKYW4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0
cy5saW51eC5pdC9saXN0aW5mby9sdHAK

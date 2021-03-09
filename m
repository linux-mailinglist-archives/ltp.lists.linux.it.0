Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD24332773
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 14:45:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B83313C6A92
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 14:45:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 80F433C4B96
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 14:45:23 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E7FDD14010F0
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 14:45:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28B23AC17;
 Tue,  9 Mar 2021 13:45:22 +0000 (UTC)
Date: Tue, 9 Mar 2021 14:45:20 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YEd78LRleAgWNeN3@pevik>
References: <20210305155123.18199-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210305155123.18199-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/6] Fuzzy Sync yielding and validation test
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgUmljaGllLAoKMXN0IHBhdGNoIGhhcyBlcnJvcjoKdHN0X2Z1enp5X3N5bmMwMS5jOiBJbiBm
dW5jdGlvbiDigJhkZWxheeKAmToKdHN0X2Z1enp5X3N5bmMwMS5jOjEwNzoxMDogZXJyb3I6IOKA
mHN0cnVjdCB0c3RfZnpzeW5jX3BhaXLigJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJh5aWVsZF9p
bl93YWl04oCZCiAgMTA3IHwgIGlmIChwYWlyLnlpZWxkX2luX3dhaXQpCiAgICAgIHwgICAgICAg
ICAgXgp0c3RfZnV6enlfc3luYzAxLmM6MTEzOjEyOiBlcnJvcjog4oCYc3RydWN0IHRzdF9menN5
bmNfcGFpcuKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmHlpZWxkX2luX3dhaXTigJkKICAxMTMg
fCAgICBpZiAocGFpci55aWVsZF9pbl93YWl0KQogICAgICB8ICAgICAgICAgICAgXgptYWtlWzFd
OiAqKiogWy4uLy4uL2luY2x1ZGUvbWsvcnVsZXMubWs6Mzc6IHRzdF9mdXp6eV9zeW5jMDFdIEVy
cm9yIDEKCjR0aCBwYXRjaCAoTGVvIFl1LUNoaSBMaWFuZydzKSBwYXRjaCBoYXMgd2FybmluZ3M6
CkluIGZpbGUgaW5jbHVkZWQgZnJvbSB0c3RfZnV6enlfc3luYzAxLmM6ODoKLi4vLi4vaW5jbHVk
ZS90c3RfZnV6enlfc3luYy5oOiBJbiBmdW5jdGlvbiDigJh0c3RfZnpzeW5jX3BhaXJfaW5pdOKA
mToKLi4vLi4vaW5jbHVkZS90c3RfZnV6enlfc3luYy5oOjE5OToxODogd2FybmluZzogY29tcGFy
aXNvbiBvZiBjb25zdGFudCDigJgw4oCZIHdpdGggYm9vbGVhbiBleHByZXNzaW9uIGlzIGFsd2F5
cyBmYWxzZSBbLVdib29sLWNvbXBhcmVdCiAgMTk5IHwgIGlmIChwYWlyLT5wYXJhbSA8IGxvdykg
ICAgICAgICAgICBcCiAgICAgIHwgICAgICAgICAgICAgICAgICBeCi4uLy4uL2luY2x1ZGUvdHN0
X2Z1enp5X3N5bmMuaDoyMjE6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmENIS+KA
mQogIDIyMSB8ICBDSEsoeWllbGRfaW5fd2FpdCwgMCwgMSwgKHRzdF9uY3B1cygpIDw9IDEpKTsK
ICAgICAgfCAgXn5+Ci4uLy4uL2luY2x1ZGUvdHN0X2Z1enp5X3N5bmMuaDoyMDE6MTg6IHdhcm5p
bmc6IGNvbXBhcmlzb24gb2YgY29uc3RhbnQg4oCYMeKAmSB3aXRoIGJvb2xlYW4gZXhwcmVzc2lv
biBpcyBhbHdheXMgZmFsc2UgWy1XYm9vbC1jb21wYXJlXQogIDIwMSB8ICBpZiAocGFpci0+cGFy
YW0gPiBoaSkgICAgICAgICAgICBcCiAgICAgIHwgICAgICAgICAgICAgICAgICBeCi4uLy4uL2lu
Y2x1ZGUvdHN0X2Z1enp5X3N5bmMuaDoyMjE6Mjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3Jv
IOKAmENIS+KAmQogIDIyMSB8ICBDSEsoeWllbGRfaW5fd2FpdCwgMCwgMSwgKHRzdF9uY3B1cygp
IDw9IDEpKTsKCgpBcGFydCBmcm9tIHRoYXQgd2hvbGUgcGF0Y2hzZXQgTEdUTSwgYWdyZWUgd2l0
aCBDeXJpbCdzIHN1Z2dlc3Rpb25zLgoKS2luZCByZWdhcmRzLApQZXRyCgotLSAKTWFpbGluZyBs
aXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==

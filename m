Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5632725289
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 16:47:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 230B83EA67C
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 16:47:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2CE083EA5E2
 for <ltp@lists.linux.it>; Tue, 21 May 2019 16:47:37 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id ED4881401A60
 for <ltp@lists.linux.it>; Tue, 21 May 2019 16:47:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 42659AF11;
 Tue, 21 May 2019 14:47:35 +0000 (UTC)
Date: Tue, 21 May 2019 16:47:33 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Steve Muckle <smuckle@google.com>
Message-ID: <20190521144733.GD19326@rei.lan>
References: <20190419210637.88522-1-smuckle@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190419210637.88522-1-smuckle@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [RFC PATCH v2] syscalls/sendmmsg: add new test
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

SGkhCj4gS25vd24gaXNzdWVzL3F1ZXN0aW9uczoKPiAgLSBUaGlzIHRlc3Qgb2NjYXNpb25hbGx5
IGdldHMgc3R1Y2sgd2hlbiB0aGUgdHdvIG1lc3NhZ2VzIGdldCBzZW50IGJ5Cj4gICAgc2VwYXJh
dGUgc2VuZG1tc2cgY2FsbHMuIFRoZSB0d28gc2VuZG1tc2cgY2FsbHMgY29tcGxldGUgc3VjY2Vz
c2Z1bGx5Cj4gICAgYnV0IHJlY3ZtbXNnIGJsb2NrcyBpbmRlZmluaXRlbHkuIEkgYW0gbm90IHll
dCBzdXJlIHdoYXQgd291bGQgY2F1c2UKPiAgICB0aGlzLgoKVGhlcmUgaXMgYSByYWNlIGJldHdl
ZW4gdGhlIHNlbmRlciBhbmQgcmVjZWl2ZXIgdGhyZWFkLCBpZiB0aGUgc2VuZGVyCnRocmVhZCBm
aW5pc2hlcyBiZWZvcmUgdGhlIHJlY2VpdmVyIHRocmVhZCBiaW5kcyB0aGUgc29ja2V0IHRoZSBw
YWNrZXRzCmFyZSBzaW1wbHkgZHJvcHBlZCBzaW5jZSB0aGlzIGlzIFNPQ0tfREdSQU0gYW5kIG5v
Ym9keSBpcyBsaXN0ZW5pbmcgYXQKdGhlIG90aGVyIHNpZGUgb2YgdGhlIHNvY2tldCB5ZXQuCgpZ
b3UgaGF2ZSB0byBzeW5jaHJvbml6ZSB0aGUgdGhyZWFkcyB3aXRoIGNoZWNrcG9pbnRzIHNvIHRo
YXQgdGhlIHNlbmRlcgp0aHJlYWQgZG9lcyBub3Qgc2VuZCBhbnl0aGluZyB1bnRpbCB0aGUgcmVj
ZWl2ZXIgYmluZHMgdGhlIHNvY2tldC4KCj4gIC0gSSBoYXZlIG5vdCB1c2VkIHRzdF9nZXRfdW51
c2VkX3BvcnQoKSBiZWNhdXNlIEknbSB1bnN1cmUgb2YgaG93IHRoYXQKPiAgICBmdW5jdGlvbiBz
aG91bGQgYmUgbWFkZSBhdmFpbGFibGUgZm9yIGJvdGggdGhlIG5ldyBhbmQgb2xkIHRlc3QgQVBJ
Pwo+ICAgIEkgY2FuIGp1c3QgY3JlYXRlIGEgZHVwbGljYXRlIGZ1bmN0aW9uIGJ1dCBpcyB0aGVy
ZSBhIGNsZWFuZXIgd2F5PwoKUGV0ZXIganVzdCBtZXJnZWQgcGF0Y2ggdGhhdCBhZGRzIHRoaXMg
ZnVuY3Rpb25hbGl0eSB0byBuZXcgbGlicmFyeS4KCllvdSBhcmUgYWxzbyBtaXNzaW5nIHRoZSBT
UERYIGxpY2VuY2UgaWRlbnRpZmllciBhbmQgb3RoZXIgdGhhbiB0aGlzCnRoZXJlIGFyZSBtaW5v
ciBjb2Rpbmcgc3R5bGUgdmlvbGF0aW9uIChoaW50IHVzZSBjaGVja3BhdGNoLnBsKS4KCkFwYXJ0
IGZyb20gdGhlc2UgdGhlIGNvZGUgbG9va3MgZ29vZC4KCi0tIApDeXJpbCBIcnViaXMKY2hydWJp
c0BzdXNlLmN6CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQv
bGlzdGluZm8vbHRwCg==

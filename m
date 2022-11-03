Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B86C66195F8
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Nov 2022 13:12:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F7A43CB346
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Nov 2022 13:12:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 29B423CB514
 for <ltp@lists.linux.it>; Fri,  4 Nov 2022 13:06:23 +0100 (CET)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id C29331400526
 for <ltp@lists.linux.it>; Thu,  3 Nov 2022 17:44:49 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7583623A
 for <ltp@lists.linux.it>; Thu,  3 Nov 2022 09:44:53 -0700 (PDT)
Received: from e126380.cambridge.arm.com (e126380.cambridge.arm.com
 [10.1.32.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 99F9A3F5A1
 for <ltp@lists.linux.it>; Thu,  3 Nov 2022 09:44:46 -0700 (PDT)
From: Teo Couprie Diaz <teo.coupriediaz@arm.com>
To: ltp@lists.linux.it
Date: Thu,  3 Nov 2022 16:44:29 +0000
Message-Id: <20221103164431.365731-1-teo.coupriediaz@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] Change return type of tst_syscall
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

SGVsbG8gTFRQIG1haW50YWluZXJzLAoKVGhlIGdvYWwgb2YgdGhpcyBwYXRjaCBpcyB0byBmaXgg
YSBtaXNtYXRjaCBiZXR3ZWVuIHRoZSByZXR1cm4gdHlwZSB1c2VkIGluIGB0c3Rfc3lzY2FsbGAs
IGBpbnRgLCBhbmQgdGhlIG9uZSB1c2VkIGJ5IHNvbWUgc3lzY2FsbHMsIGBsb25nYCBvciBgdm9p
ZCAqYCBmb3IgZXhhbXBsZSwgd2hpY2ggY2FuIGJlIGxhcmdlciB0aGFuIGFuIGludCBhbmQgbGVh
ZCB0byBhbiBpbmNvcnJlY3QgdGVzdC4KCkFzIEN5cmlsIEhydWJpcycgZmVlZGJhY2sgb24gdGhl
IFJGQyBJIHNlbnQgZWFybGllciB3YXMgbW9zdGx5IHBvc2l0aXZlLCBJIGFtIG5vdyBzZW5kaW5n
IGl0IGFzIGEgcGF0Y2ggcHJvcGVyLiBUaGFua3MgYWdhaW4gZm9yIGhhdmluZyBhIGxvb2sgIQoK
VGhlIG1haW4gY2hhbmdlIHNpbmNlIHRoZSBSRkMgaXMgdGhhdCB0aGUgdGVzdCBzdWl0ZSBJIHVz
ZWQgZm9yIHRlc3RpbmcgdGhlIGNoYW5nZSwgc3BlY2lmaWMgdG8gdGVzdCB0aGF0IHVzZSB0c3Rf
c3lzY2FsbCwgaXMgbm93IGluIGEgc3BlYXJhdGUgY29tbWl0IHdoaWNoIGlzIG5vdCB0byBiZSBt
ZXJnZWQuClRoZSBwb2ludCBpcyB0byBwcm92aWRlIGEgcmVmZXJlbmNlIHRvIHdoYXQgd2FzIHRl
c3RlZCBhbmQgd2hhdCBjb3VsZCBiZSBpbXBhY3RlZC4KCgpDSSBidWlsZCBvbiBsYXRlc3QgbWFz
dGVyOgpodHRwczovL2dpdGh1Yi5jb20vVGVvLUNEL2x0cC9hY3Rpb25zL3J1bnMvMzM4NjU2NzQy
NAoKUkZDIHBhdGNoIG9uIHRoZSBtYWlsaW5nIGxpc3QgYXJjaGl2ZToKaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbHRwLzIwMjIxMDI3MTYzNjU0LjQxNDAxNy0xLXRlby5jb3VwcmllZGlhekBhcm0u
Y29tL1QvI200M2U2YTEyODAxOWQ5NGEyMTVkZTMzNDMzZjA5ZTA2Zjc3MzRjOWEyCgpUaGFuayB5
b3UgaW4gYWR2YW5jZSwKVMOpbyBDb3VwcmllIERpYXoKCi0tClRlbyBDb3VwcmllIERpYXogKDIp
OgogIHJlZ2VuLnNoOiBVc2UgaW50cHRyX3QgZm9yIHRzdF9zeXNjYWxsIHJldHVybgogIFtETyBO
T1QgTUVSR0VdIHRzdF9zeXNjYWxsIHRlc3Qgc3VpdGUKCiBpbmNsdWRlL2xhcGkvc3lzY2FsbHMv
cmVnZW4uc2ggfCAgIDIgKy0KIHJ1bnRlc3QvY2hlY2tfdHN0X3N5c2NhbGwgICAgICB8IDE5MCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTkxIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBydW50ZXN0L2No
ZWNrX3RzdF9zeXNjYWxsCgoKYmFzZS1jb21taXQ6IGI2MDZhN2M3ZGM2MTNiODA0MWY3YjM5NTg2
OTVmMmNkZGUwNGZiZTUKLS0gCjIuMjUuMQoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

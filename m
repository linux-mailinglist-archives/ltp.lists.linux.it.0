Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAAC34084
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 09:40:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9FF233EAB0C
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jun 2019 09:40:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id AF5D23EA13F
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 09:40:54 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 75E8C201126
 for <ltp@lists.linux.it>; Tue,  4 Jun 2019 09:40:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AE27D307D945;
 Tue,  4 Jun 2019 07:40:44 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E965C1001925;
 Tue,  4 Jun 2019 07:40:42 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: ltp@lists.linux.it,
	chrubis@suse.cz
Date: Tue,  4 Jun 2019 15:40:35 +0800
Message-Id: <20190604074035.4523-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 04 Jun 2019 07:40:52 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_test.c: set mount_device amd format_device of
	all_filesystems is set
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

cHJlYWR2MjAzLmMgZG9lcyBub3Qgc2V0IG1vdW50X2RldmljZSwgd2hpY2ggbWFrZXMgQlJPSzoK
ICBwcmVhZHYyMDMuYzoxMjI6IEJST0s6IHByZWFkdjIoKSBmYWlsZWQ6IEVPUE5PVFNVUFAKCkZp
eGluZyB0aGlzIGJ5IGZvcm1hdCBhbmQgbW91bnQgZGV2aWNlIGlmIGFsbF9maWxlc3lzdGVtcyBp
cyBzZXQgaW4gbGlicmFyeS4KClNpZ25lZC1vZmYtYnk6IE11cnBoeSBaaG91IDx4emhvdUByZWRo
YXQuY29tPgotLS0KIGxpYi90c3RfdGVzdC5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi90c3RfdGVzdC5j
IGIvbGliL3RzdF90ZXN0LmMKaW5kZXggOTVmMzg5ZDJlLi42MWRiYTc5M2UgMTAwNjQ0Ci0tLSBh
L2xpYi90c3RfdGVzdC5jCisrKyBiL2xpYi90c3RfdGVzdC5jCkBAIC04MDgsOCArODA4LDExIEBA
IHN0YXRpYyB2b2lkIGRvX3NldHVwKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAJCXRzdF90ZXN0
LT5mb3JtYXRfZGV2aWNlID0gMTsKIAl9CiAKLQlpZiAodHN0X3Rlc3QtPmFsbF9maWxlc3lzdGVt
cykKKwlpZiAodHN0X3Rlc3QtPmFsbF9maWxlc3lzdGVtcykgewogCQl0c3RfdGVzdC0+bmVlZHNf
ZGV2aWNlID0gMTsKKwkJdHN0X3Rlc3QtPm1vdW50X2RldmljZSA9IDE7CisJCXRzdF90ZXN0LT5m
b3JtYXRfZGV2aWNlID0gMTsKKwl9CiAKIAlzZXR1cF9pcGMoKTsKIAotLSAKMi4yMS4wCgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D39B2F8E5
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 10:58:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3270F3EA64A
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2019 10:58:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 67D943EA113
 for <ltp@lists.linux.it>; Thu, 30 May 2019 10:58:42 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0165D6008C9
 for <ltp@lists.linux.it>; Thu, 30 May 2019 10:58:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 16D5230B46F1
 for <ltp@lists.linux.it>; Thu, 30 May 2019 08:58:40 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86C316402A;
 Thu, 30 May 2019 08:58:39 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: ltp@lists.linux.it
Date: Thu, 30 May 2019 16:58:34 +0800
Message-Id: <20190530085834.21432-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Thu, 30 May 2019 08:58:40 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] lib/tst_test: print INFO msg for test variants
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

TWFrZSB0aGUgdGVzdCBvdXRwdXQgY2xlYXJlciBhYm91dCB3aGF0J3MgZ29pbmcgb24gd2hlbiB3
ZQpydW4gbXVsdGlwbGUgdmFyaWFudHMuCgpTaWduZWQtb2ZmLWJ5OiBNdXJwaHkgWmhvdSA8eHpo
b3VAcmVkaGF0LmNvbT4KLS0tCiBsaWIvdHN0X3Rlc3QuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvbGliL3RzdF90ZXN0LmMgYi9saWIvdHN0X3Rl
c3QuYwppbmRleCAyZDg4YWRiZDcuLmZlYzZjOWFiYSAxMDA2NDQKLS0tIGEvbGliL3RzdF90ZXN0
LmMKKysrIGIvbGliL3RzdF90ZXN0LmMKQEAgLTEyMDEsNiArMTIwMSw3IEBAIHZvaWQgdHN0X3J1
bl90Y2FzZXMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSwgc3RydWN0IHRzdF90ZXN0ICpzZWxmKQog
CQl0ZXN0X3ZhcmlhbnRzID0gdHN0X3Rlc3QtPnRlc3RfdmFyaWFudHM7CiAKIAlmb3IgKHRzdF92
YXJpYW50ID0gMDsgdHN0X3ZhcmlhbnQgPCB0ZXN0X3ZhcmlhbnRzOyB0c3RfdmFyaWFudCsrKSB7
CisJCXRzdF9yZXMoVElORk8sICJSdW5uaW5nIHRzdF92YXJpYW50ICVkXG4iLCB0c3RfdmFyaWFu
dCk7CiAJCWlmICh0c3RfdGVzdC0+YWxsX2ZpbGVzeXN0ZW1zKQogCQkJcmV0IHw9IHJ1bl90Y2Fz
ZXNfcGVyX2ZzKCk7CiAJCWVsc2UKLS0gCjIuMjEuMAoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzog
aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

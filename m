Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A2B1E1BF4
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 09:09:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48BD73C3275
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 09:09:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 7CF073C2235
 for <ltp@lists.linux.it>; Tue, 26 May 2020 09:09:08 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id B85161A013B5
 for <ltp@lists.linux.it>; Tue, 26 May 2020 09:09:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590476946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VOF+E2hDjatRCqW1RgfI3Ynl/a7pMcIirAYZK0p3JhI=;
 b=CrhgrW6rcGgTezdFnZkR9AUzWp7nFgR4pPMZOq5khSz/cJWb4PuiVnLmI0MUwl/RCdZkUZ
 KyVhcgVCppmVexFwypqxAA7RN+0H1tQf73lREzK055x78nDe0Ch7PlYRV3byzYEpX90dEU
 ieS6/5xQAf/ssgJJ+6/BKli7Is9sCWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-_CqScCPEPDm6sZJaRMPBoA-1; Tue, 26 May 2020 03:09:04 -0400
X-MC-Unique: _CqScCPEPDm6sZJaRMPBoA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 952BB107ACCD
 for <ltp@lists.linux.it>; Tue, 26 May 2020 07:09:03 +0000 (UTC)
Received: from liwang-workstation.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 81FA67A8A0;
 Tue, 26 May 2020 07:09:02 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 26 May 2020 15:09:01 +0800
Message-Id: <20200526070901.12957-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] lib: use TCONF if hpage reserve failed in retry
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

VGVzdCBzdGlsbCBlYXN5IHRvIGdldCBmYWlsIGluwqBocGFnZXPCoHJlc2VydmluZyAob25seSA4
MCUgb2YKbWF4X2hwYWdlcykgYmVjYXVzZSBvZiBtZW1vcnkgZnJhZ21lbnRhdGlvbi4KIMKgCiAg
dHN0X2h1Z2VwYWdlLmM6NDY6IEJST0s6IG5yX2h1Z2VwYWdlcyA9IDE3MSwgYnV0IGV4cGVjdCAy
NTUKwqAgwqAKQnV0IGl0IHNlZW1zIHVua2luZCBhbmQgdXNlbGVzcyB0byBleGl0IHdpdGggVEJS
T0sgd2hlbiBmYWlsZWQKaW4gaHBhZ2UgcmVzZXJ2ZSByZXRyeWluZy4gVGhpcyBwYXRjaCBwcm9w
b3NlcyB0byB1c2UgVENPTkYgZm9yCmJldHRlciBsb2cgcmV2aWV3LgoKU2lnbmVkLW9mZi1ieTog
TGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+CkNjOiBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVk
aGF0LmNvbT4KLS0tCiBsaWIvdHN0X2h1Z2VwYWdlLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvdHN0X2h1
Z2VwYWdlLmMgYi9saWIvdHN0X2h1Z2VwYWdlLmMKaW5kZXggNTI2NjdhMTRlLi5mMmJmNWQyMGUg
MTAwNjQ0Ci0tLSBhL2xpYi90c3RfaHVnZXBhZ2UuYworKysgYi9saWIvdHN0X2h1Z2VwYWdlLmMK
QEAgLTQzLDcgKzQzLDkgQEAgdW5zaWduZWQgbG9uZyB0c3RfcmVxdWVzdF9odWdlcGFnZXModW5z
aWduZWQgbG9uZyBocGFnZXMpCiAJU0FGRV9GSUxFX1BSSU5URihQQVRIX05SX0hQQUdFUywgIiVs
dSIsIHRzdF9odWdlcGFnZXMpOwogCVNBRkVfRklMRV9TQ0FORihQQVRIX05SX0hQQUdFUywgIiVs
dSIsICZ2YWwpOwogCWlmICh2YWwgIT0gdHN0X2h1Z2VwYWdlcykKLQkJdHN0X2JyayhUQlJPSywg
Im5yX2h1Z2VwYWdlcyA9ICVsdSwgYnV0IGV4cGVjdCAlbHUiLCB2YWwsIHRzdF9odWdlcGFnZXMp
OworCQl0c3RfYnJrKFRDT05GLCAibnJfaHVnZXBhZ2VzID0gJWx1LCBidXQgZXhwZWN0ICVsdS4g
IgorCQkJCSJOb3QgZW5vdWdoIGh1Z2VwYWdlcyBmb3IgdGVzdGluZy4iLAorCQkJCXZhbCwgdHN0
X2h1Z2VwYWdlcyk7CiAKIAl0c3RfcmVzKFRJTkZPLCAiJWx1IGh1Z2VwYWdlKHMpIHJlc2VydmVk
IiwgdHN0X2h1Z2VwYWdlcyk7CiBvdXQ6Ci0tIAoyLjIxLjEKCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==

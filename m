Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDDFEFCE
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 06:57:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F4BC3EACB5
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 06:57:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8BEA23EA0B8
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 06:57:52 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 209F710009F0
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 06:57:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AE648307D90D;
 Tue, 30 Apr 2019 04:57:49 +0000 (UTC)
Received: from localhost (dhcp-12-130.nay.redhat.com [10.66.12.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1036069730;
 Tue, 30 Apr 2019 04:57:48 +0000 (UTC)
From: Murphy Zhou <xzhou@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 30 Apr 2019 12:57:46 +0800
Message-Id: <20190430045746.1332-1-xzhou@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 30 Apr 2019 04:57:49 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] fcntl33: weakup child before exit if fail in parent
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

Tm93IGl0IGZhaWxpcyBvbiBvdmVybGF5ZnMgdGhpcyB3YXk6CmZjbnRsMzMuYzoxMjA6IElORk86
IC4uLi4gZmFpbGVkIG9uIG92ZXJsYXBmcyBhcyBleHBlY3RlZDogRUFHQUlOL0VXT1VMREJMT0NL
CnRzdF9jaGVja3BvaW50LmM6MTQ5OiBCUk9LOiBmY250bDMzLmM6MTc4OiB0c3RfY2hlY2twb2lu
dF93YWl0KDAsIDEwMDAwKTogRVRJTUVET1VUCnRzdF90ZXN0LmM6MzU3OiBCUk9LOiBSZXBvcnRl
ZCBieSBjaGlsZCAoMTIwNjYpCgpTaWduZWQtb2ZmLWJ5OiBNdXJwaHkgWmhvdSA8eHpob3VAcmVk
aGF0LmNvbT4KLS0tCiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2ZjbnRsL2ZjbnRsMzMuYyB8
IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMzLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL2ZjbnRsL2ZjbnRsMzMuYwppbmRleCA0M2RjNWEyYWYuLmNlMjdlMTAwNiAxMDA2NDQK
LS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMzLmMKKysrIGIvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9mY250bC9mY250bDMzLmMKQEAgLTEyMSw2ICsxMjEsNyBA
QCBzdGF0aWMgdm9pZCBkb190ZXN0KHVuc2lnbmVkIGludCBpKQogCQl9IGVsc2UgewogCQkJdHN0
X3JlcyhURkFJTCB8IFRURVJSTk8sICJmY250bCgpIGZhaWxlZCB0byBzZXQgbGVhc2UiKTsKIAkJ
fQorCQlUU1RfQ0hFQ0tQT0lOVF9XQUtFKDApOwogCQlnb3RvIGV4aXQ7CiAJfQogCi0tIAoyLjIx
LjAKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGlu
Zm8vbHRwCg==

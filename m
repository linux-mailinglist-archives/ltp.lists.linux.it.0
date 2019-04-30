Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E000EEA6
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 04:02:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 32F073EA063
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Apr 2019 04:02:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7CEB23EA063
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 04:01:58 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 76AD71400E04
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 04:01:55 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,411,1549900800"; d="scan'208";a="61104045"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Apr 2019 10:01:53 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
 by cn.fujitsu.com (Postfix) with ESMTP id BC23F4CD84D2
 for <ltp@lists.linux.it>; Tue, 30 Apr 2019 10:01:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.215.39) by
 G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 30 Apr 2019 10:01:55 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Tue, 30 Apr 2019 10:01:44 +0800
Message-ID: <1556589704-15305-1-git-send-email-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.215.39]
X-yoursite-MailScanner-ID: BC23F4CD84D2.ABAB0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=none autolearn=disabled
 version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] scenario_groups/default: Add crypto into default run
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

U2lnbmVkLW9mZi1ieTogWGlhbyBZYW5nIDx5YW5neC5qeUBjbi5mdWppdHN1LmNvbT4KLS0tCiBz
Y2VuYXJpb19ncm91cHMvZGVmYXVsdCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvc2NlbmFyaW9fZ3JvdXBzL2RlZmF1bHQgYi9zY2VuYXJpb19ncm91
cHMvZGVmYXVsdAppbmRleCA5YWRiNzVkLi4xZjNlNWIyIDEwMDY0NAotLS0gYS9zY2VuYXJpb19n
cm91cHMvZGVmYXVsdAorKysgYi9zY2VuYXJpb19ncm91cHMvZGVmYXVsdApAQCAtMjksMyArMjks
NCBAQCBjcHVob3RwbHVnCiBuZXQuaXB2Nl9saWIKIGlucHV0CiBjdmUKK2NyeXB0bwotLSAKMS44
LjMuMQoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=

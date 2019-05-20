Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB1B24322
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 23:49:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93A022D0137
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 23:49:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 2EB9C3EA62E
 for <ltp@lists.linux.it>; Mon, 20 May 2019 23:49:21 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B6B361000BEA
 for <ltp@lists.linux.it>; Mon, 20 May 2019 23:49:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DDBBDAF46;
 Mon, 20 May 2019 21:49:18 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 20 May 2019 23:49:11 +0200
Message-Id: <20190520214911.1460-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] lapi/ustat.h: Replace daddr_t with long
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

RnJvbTogUGV0ciBWb3JlbCA8cGV0ci52b3JlbEBnbWFpbC5jb20+CgpkYWRkcl90IGlzIHVzdWFs
bHkgdHlwZWRlZiB0byBfX2tlcm5lbF9kYWRkcl90LAp3aGljaCBpcyBpbnQgb3IgbG9uZy4KVXNp
bmcgbG9uZyBhcyBkYWRkcl90IGlzIG5vdCBkZWZpbmVkIGF0IGxlYXN0IG9uIG11c2wuCgpTaWdu
ZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4KLS0tCiBpbmNsdWRl
L2xhcGkvdXN0YXQuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGFwaS91c3RhdC5oIGIvaW5jbHVkZS9s
YXBpL3VzdGF0LmgKaW5kZXggMTJjMDczNTgyLi4wMzAxNzljNGEgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGFwaS91c3RhdC5oCisrKyBiL2luY2x1ZGUvbGFwaS91c3RhdC5oCkBAIC0xMSw3ICsxMSw3
IEBACiAjIGluY2x1ZGUgPHN5cy91c3RhdC5oPgogI2Vsc2UKIHN0cnVjdCB1c3RhdCB7Ci0JZGFk
ZHJfdCBmX3RmcmVlOworCWxvbmcgZl90ZnJlZTsKIAlpbm9fdCBmX3Rpbm9kZTsKIAljaGFyIGZf
Zm5hbWVbNl07CiAJY2hhciBmX2ZwYWNrWzZdOwotLSAKMi4yMS4wCgoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BED897E7
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 09:34:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C3E923C1CE4
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 09:34:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 729963C0886
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 09:34:49 +0200 (CEST)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6DA121A006EF
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 09:34:46 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Aug 2019 00:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,376,1559545200"; d="scan'208";a="259700958"
Received: from yixin-dev.sh.intel.com ([10.239.161.25])
 by orsmga001.jf.intel.com with ESMTP; 12 Aug 2019 00:34:42 -0700
From: Yixin Zhang <yixin.zhang@intel.com>
To: ltp@lists.linux.it,
	Yixin Zhang <yixin.zhang@intel.com>
Date: Mon, 12 Aug 2019 15:24:31 +0800
Message-Id: <20190812072431.24378-1-yixin.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH ltp] runtest/fs: remove non-acsii char from comment
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

UmVtb3ZlIG5vbi1hY3NpaSBjaGFyIDxDMj48QjQ+IGZyb20gY29tbWVudAoKU2lnbmVkLW9mZi1i
eTogWWl4aW4gWmhhbmcgPHlpeGluLnpoYW5nQGludGVsLmNvbT4KLS0tCiBydW50ZXN0L2ZzIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvcnVudGVzdC9mcyBiL3J1bnRlc3QvZnMKaW5kZXggZWYyZTg0OGI5Li4wN2Q2ZTJi
NjcgMTAwNjQ0Ci0tLSBhL3J1bnRlc3QvZnMKKysrIGIvcnVudGVzdC9mcwpAQCAtNjYsNyArNjYs
NyBAQCBmc19kaSBmc19kaSAtZCAkVE1QRElSCiAKICMgUmVhZCBldmVyeSBmaWxlIGluIC9wcm9j
LiBOb3QgbGlrZWx5IHRvIGNyYXNoLCBidXQgZG9lcyBlbm91Z2gKICMgdG8gZGlzdHVyYiB0aGUg
a2VybmVsLiBBIGdvb2Qga2VybmVsIGxhdGVuY3kga2lsbGVyIHRvby4KLSMgV2FzIG5vdCBzdXJl
IHdoeSBpdCBzaG91bGQgcmVzaWRlIGluIHJ1bnRlc3QvY3Jhc2htZSBhbmQgd29uwrR0IGdldCB0
ZXN0ZWQgZXZlcgorIyBXYXMgbm90IHN1cmUgd2h5IGl0IHNob3VsZCByZXNpZGUgaW4gcnVudGVz
dC9jcmFzaG1lIGFuZCB3b24ndCBnZXQgdGVzdGVkIGV2ZXIKIHByb2MwMSBwcm9jMDEgLW0gMTI4
CiAKIHJlYWRfYWxsX2RldiByZWFkX2FsbCAtZCAvZGV2IC1wIC1xIC1yIDEwCi0tIAoyLjE3LjEK
CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8v
bHRwCg==

Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D11EDE14EE
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 11:00:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 914FC3C22A7
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 11:00:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4AB653C2297
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 11:00:37 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 93AAB600D43
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 11:00:33 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.68,220,1569254400"; d="scan'208";a="77359689"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Oct 2019 17:00:25 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id BCB5D4CE150B;
 Wed, 23 Oct 2019 16:52:32 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 23 Oct 2019 17:00:25 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 23 Oct 2019 17:00:25 +0800
Message-ID: <1571821231-3846-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: BCB5D4CE150B.ADB5A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/6] optimize quotactl test code
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
Cc: jack@suse.cz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SSBjbGVhbnVwIHRoZSBxdW90YWN0bCBjb2RlIGFuZCBhZGQgcHJvamVjdCBxdW90YSB0ZXN0IGZv
ciBxdW90YWN0bC4KVGhhbmtzIHRvIEphbiBLYXJhIHdpdGggc3VwcG9ydCBhYm91dCBxdW90YS4K
CgotLS0tLS0tLS0tLS0KdjEtPnYyOgpmb3IgcXVvdGFjdGwwMi5jLCBhZGQgZ3JvdXAgcXVvdGEg
dGVzdCBhbmQgYWRkIFFfWFFVVE9BUk0gdGVzdAoKYWRkIHF1b3RhY3RsMDQuYyBhbmQgYWRkIHF1
b3RhMDUuYyB0byB0ZXN0IHByb2plY3QgcXVvdGEuCi0tLS0tLS0tLS0tLQoKWWFuZyBYdSAoNik6
CiAgc3lzY2FsbHMvcXVvdGFjdGw6IERvbid0IHVzZSBsdHAtcXVvdGEubTQKICBtNC9sdHAteGZz
X3F1b3RhLm00OiBSZW1vdmUgdXNlbGVzcyBsdHDigJR4ZnNfcXVvdGEubTQKICBzeXNjYWxscy9x
dW90YWN0bDAxLmM6IEFkZCBRX0dFVE5FWFFVT1RBIHRlc3QKICBzeXNjYWxscy9xdW90YWN0bDAy
LmM6IEFkZCBRX1hHRVRRU1RBVFYgYW5kIFFfWFFVT1RBUk0gdGVzdAogIHN5c2NhbGxzL3F1b3Rh
Y3RsMDQ6IGFkZCBwcm9qZWN0IHF1b3RhIHRlc3QgZm9yIG5vbi14ZnMgZmlsZXN5c3RlbQogIHN5
c2NhbGxzL3F1b3RhY3RsMDU6IGFkZCBwcm9qZWN0IHF1b3RhIHRlc3QgZm9yIHhmcyBmaWxlc3lz
dGVtCgogY29uZmlndXJlLmFjICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAy
ICstCiBpbmNsdWRlL2xhcGkvcXVvdGFjdGwuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgMzUg
KystCiBtNC9sdHAtcXVvdGEubTQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzYg
Ky0tCiBtNC9sdHAteGZzX3F1b3RhLm00ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjMg
LS0KIHJ1bnRlc3Qvc3lzY2FsbHMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiAr
CiB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3F1b3RhY3RsLy5naXRpZ25vcmUgfCAgIDIgKwog
Li4uL2tlcm5lbC9zeXNjYWxscy9xdW90YWN0bC9xdW90YWN0bDAxLmMgICAgIHwgMTMzICsrKysr
LS0tLQogLi4uL2tlcm5lbC9zeXNjYWxscy9xdW90YWN0bC9xdW90YWN0bDAyLmMgICAgIHwgMjE4
ICsrKysrKysrKysrLS0tCiAuLi4va2VybmVsL3N5c2NhbGxzL3F1b3RhY3RsL3F1b3RhY3RsMDMu
YyAgICAgfCAgMjIgKy0KIC4uLi9rZXJuZWwvc3lzY2FsbHMvcXVvdGFjdGwvcXVvdGFjdGwwNC5j
ICAgICB8IDE1OSArKysrKysrKysrCiAuLi4va2VybmVsL3N5c2NhbGxzL3F1b3RhY3RsL3F1b3Rh
Y3RsMDUuYyAgICAgfCAyNzYgKysrKysrKysrKysrKysrKysrCiAxMSBmaWxlcyBjaGFuZ2VkLCA3
MjcgaW5zZXJ0aW9ucygrKSwgMTgxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG00
L2x0cC14ZnNfcXVvdGEubTQKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL3F1b3RhY3RsL3F1b3RhY3RsMDQuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RjYXNl
cy9rZXJuZWwvc3lzY2FsbHMvcXVvdGFjdGwvcXVvdGFjdGwwNS5jCgotLSAKMi4xOC4wCgoKCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==

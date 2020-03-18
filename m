Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDE1189514
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 05:55:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D0AD03C55EC
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Mar 2020 05:55:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9F47C3C17A1
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 05:55:22 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id E5D30600A64
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 05:55:19 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,566,1574092800"; d="scan'208";a="86521030"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Mar 2020 12:55:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id D14C049DF12D
 for <ltp@lists.linux.it>; Wed, 18 Mar 2020 12:45:07 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 18 Mar 2020 12:55:11 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 18 Mar 2020 12:55:09 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 18 Mar 2020 12:55:02 +0800
Message-ID: <1584507302-23515-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: D14C049DF12D.ADF64
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.2 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] ltp_tpci.c: fix a null pointer
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

U2luY2UgY29tbWl0IDNkZDI4NmJkYmVlICgibHRwX3RwY2kuYzogVXBkYXRlIGxlZ2FjeSBjb2Rl
IiksCml0IGludHJvZHVjZWQgYSB3YXJuaW5nIGFzIGJlbG93OgouLi9sdHBfdHBjaS5jOiBJbiBm
dW5jdGlvbiDigJhwcm9iZV9wY2lfZGV24oCZOgouLi9sdHBfdHBjaS5jOjEwNzo4OiB3YXJuaW5n
OiDigJhkZXbigJkgaXMgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24gWy1XdW5p
bml0aWFsaXplZF0KICBzdHJ1Y3QgcGNpX2RldiAqZGV2OwogIGRldiA9IHBjaV9nZXRfZG9tYWlu
X2J1c19hbmRfc2xvdChwY2lfZG9tYWluX25yKGRldi0+YnVzKSwgYnVzLCBzbG90KQoKVGhpcyB3
aWxsIGxlYWQgdG8gc3lzdGVtIGNyYXNoIHdoZW4gd2UgcnVuIHRoaXMgY2FzZSBiZWNhdXNlIGl0
IHRyaWdnZXJzIGEgbnVsbCBwb2ludGVyLgpVc2UgMCBkb21haW4gaW50ZWFkIG9mIHBjaV9kb21h
aW5fbnIuCgpwczogSSB3YW50IHRvIHVzZSBhIGR5bWFpYyBkb21haW4gdG8gZml4IGl0IGJ1dCBm
YWlsZWQuIElmIHNvbWVvbmUga25vdywKcGxlYXNlIHRlbGwgbWUuIEFsc28sIHRoaXMgY2FzZSBm
YWlsZWQgd2hlbiBtZXJnaW5nIHRoaXMgcGF0Y2ggYmVjYXVzZQp0ZXN0IDEzICh0ZXN0X2Fzc2ln
bl9yZXNvdXJjZXMpIHJlcG9ydCBubyBzcGFjZSBlcnJvciBhcyBiZWxvdzoKWzc1NDkzMC43NTc1
ODVdIGx0cF90cGNpOiB0ZXN0LWNhc2UgMTMKWzc1NDkzMC43NTc1ODVdIGx0cF90cGNpOiBhc3Np
Z24gcmVzb3VyY2VzCls3NTQ5MzAuNzU3NTg1XSBsdHBfdHBjaTogYXNzaWduIHJlc291cmNlICMw
Cls3NTQ5MzAuNzU3NTg2XSBsdHBfdHBjaTogbmFtZSA9IDAwMDA6MDA6MDguMCwgZmxhZ3MgPSAy
NjI0MDEsIHN0YXJ0IDB4YzE0MCwgZW5kIDB4YzE3ZgpbNzU0OTMwLjc1NzU4Nl0gbHRwX3RwY2k6
IGFzc2lnbiByZXNvdXJjZSAjMQpbNzU0OTMwLjc1NzU4N10gbHRwX3RwY2k6IG5hbWUgPSAwMDAw
OjAwOjA4LjAsIGZsYWdzID0gMjYyNjU2LCBzdGFydCAweGZlYmQ3MDAwLCBlbmQgMHhmZWJkN2Zm
ZgpbNzU0OTMwLjc1NzU4N10gbHRwX3RwY2k6IGFzc2lnbiByZXNvdXJjZSAjMgpbNzU0OTMwLjc1
NzU4N10gbHRwX3RwY2k6IG5hbWUgPSAwMDAwOjAwOjA4LjAsIGZsYWdzID0gMCwgc3RhcnQgMHgw
LCBlbmQgMHgwCls3NTQ5MzAuNzU3NTg4XSBsdHBfdHBjaTogYXNzaWduIHJlc291cmNlICMzCls3
NTQ5MzAuNzU3NTg4XSBsdHBfdHBjaTogbmFtZSA9IDAwMDA6MDA6MDguMCwgZmxhZ3MgPSAwLCBz
dGFydCAweDAsIGVuZCAweDAKWzc1NDkzMC43NTc1ODhdIGx0cF90cGNpOiBhc3NpZ24gcmVzb3Vy
Y2UgIzQKWzc1NDkzMC43NTc1ODldIGx0cF90cGNpOiBuYW1lID0gMDAwMDowMDowOC4wLCBmbGFn
cyA9IDUzODE5MDM0OCwgc3RhcnQgMHhmZTgwYzAwMCwgZW5kIDB4ZmU4MGZmZmYKWzc1NDkzMC43
NTc1OTNdIHZpcnRpby1wY2kgMDAwMDowMDowOC4wOiBCQVIgNDogbm8gc3BhY2UgZm9yIFttZW0g
c2l6ZSAweDAwMDA0MDAwIDY0Yml0IHByZWZdCls3NTQ5MzAuNzU3NTk0XSB2aXJ0aW8tcGNpIDAw
MDA6MDA6MDguMDogQkFSIDQ6IGZhaWxlZCB0byBhc3NpZ24gW21lbSBzaXplIDB4MDAwMDQwMDAg
NjRiaXQgcHJlZgoKRml4ZXM6IDNkZDI4NmIgKCJsdHBfdHBjaS5jOiBVcGRhdGUgbGVnYWN5IGNv
ZGUiKQpTaWduZWQtb2ZmLWJ5OiBZYW5nIFh1IDx4dXlhbmcyMDE4Lmp5QGNuLmZ1aml0c3UuY29t
PgotLS0KIHRlc3RjYXNlcy9rZXJuZWwvZGV2aWNlLWRyaXZlcnMvcGNpL3RwY2lfa2VybmVsL2x0
cF90cGNpLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL3BjaS90
cGNpX2tlcm5lbC9sdHBfdHBjaS5jIGIvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy9w
Y2kvdHBjaV9rZXJuZWwvbHRwX3RwY2kuYwppbmRleCA3Y2JhYmZhYTUuLmE1Nzk1M2RiNiAxMDA2
NDQKLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9kZXZpY2UtZHJpdmVycy9wY2kvdHBjaV9rZXJuZWwv
bHRwX3RwY2kuYworKysgYi90ZXN0Y2FzZXMva2VybmVsL2RldmljZS1kcml2ZXJzL3BjaS90cGNp
X2tlcm5lbC9sdHBfdHBjaS5jCkBAIC0xMDQsNyArMTA0LDcgQEAgc3RhdGljIGludCBwcm9iZV9w
Y2lfZGV2KHVuc2lnbmVkIGludCBidXMsIHVuc2lnbmVkIGludCBzbG90KQogCQlsdHBfcGNpLmRl
diA9IE5VTEw7CiAJfQogCi0JZGV2ID0gcGNpX2dldF9kb21haW5fYnVzX2FuZF9zbG90KHBjaV9k
b21haW5fbnIoZGV2LT5idXMpLCBidXMsIHNsb3QpOworCWRldiA9IHBjaV9nZXRfZG9tYWluX2J1
c19hbmRfc2xvdCgwLCBidXMsIHNsb3QpOwogCWlmICghZGV2IHx8ICFkZXYtPmRyaXZlcikKIAkJ
cmV0dXJuIC1FTk9ERVY7CiAKLS0gCjIuMTguMQoKCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

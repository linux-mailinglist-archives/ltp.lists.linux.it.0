Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6F34B888
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 14:31:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 113533EA549
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Jun 2019 14:31:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 598E03EA2E7
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 14:31:51 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DBCC6600041
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 14:31:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8FFD3AEC5
 for <ltp@lists.linux.it>; Wed, 19 Jun 2019 12:31:49 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 19 Jun 2019 14:31:46 +0200
Message-Id: <20190619123148.29733-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 0/2] sync_file_range02 skip tests on FUSE
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

QXMgZGlzY3Vzc2VkIG9uIExUUCBNTCBpdCBkb2VzIG5vdCBtYWtlIHNlbnNlIHRvIHJ1biB0aGUK
c3luY19maWxlX3JhbmdlLgoKQ3lyaWwgSHJ1YmlzICgyKToKICBsaWI6IEFkZCBmbGFncyB0byB0
c3RfZ2V0X3N1cHBvcnRlZF9mc190eXBlcygpCiAgc3lzY2FsbHMvc3luY19maWxlX3JhbmdlMDI6
IFNraXAgdGVzdCBvbiBmdXNlLgoKIGluY2x1ZGUvdHN0X2ZzLmggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNiArKysrLS0KIGluY2x1ZGUvdHN0X3Rlc3QuaCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArKwogbGliL3RzdF9zdXBwb3J0ZWRfZnNfdHlwZXMu
YyAgICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysrKystLS0tLQogbGliL3RzdF90ZXN0
LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiAuLi4vc3lzY2Fs
bHMvc3luY19maWxlX3JhbmdlL3N5bmNfZmlsZV9yYW5nZTAyLmMgIHwgIDEgKwogdGVzdGNhc2Vz
L2xpYi90c3Rfc3VwcG9ydGVkX2ZzLmMgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIDYgZmls
ZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgotLSAKMi4xOS4y
CgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=

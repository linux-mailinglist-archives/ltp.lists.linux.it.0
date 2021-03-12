Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE8F33905C
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 15:52:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5FC6B3C6857
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Mar 2021 15:52:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D002E3C2EE1
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 15:52:53 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id CAFBD6010B5
 for <ltp@lists.linux.it>; Fri, 12 Mar 2021 15:52:52 +0100 (CET)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AWaR7+Kpx4Ye63qVfXhKMFcYaV5rLeYIsi2QD?=
 =?us-ascii?q?101hICF9WMqeisyogbAnxQb54QxhPE0ItPKhHO27QX3a/YNo+oV5B9qfdSTvpW?=
 =?us-ascii?q?fAFu9fxKTvzzDqEyf9ss5xvJ0LT4FQE9v1ZGIase/fwC2VV+kt28OG9qfAv5a6?=
 =?us-ascii?q?815IQRtxY69tqydVYzzrcXFefwVNCZonGJf03KMuyAaIQ2gdbciwGxA+Lor+ju?=
 =?us-ascii?q?DM/aiHXTc2QzYj6CSryQij8aPGFXGjtSs2YndixqgD/AH+/zDE2g=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.81,243,1610380800"; d="scan'208";a="105554167"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Mar 2021 22:52:49 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 4AFFD4CEA9A0;
 Fri, 12 Mar 2021 22:52:47 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 12 Mar 2021 22:52:46 +0800
Message-ID: <604B803D.6090704@cn.fujitsu.com>
Date: Fri, 12 Mar 2021 22:52:45 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20210308160122.24522-1-pvorel@suse.cz>
 <20210308160122.24522-2-pvorel@suse.cz> <YEtFmok1oxZjcKVi@yuki.lan>
 <YEtKL70YWfv+yzyZ@pevik>
In-Reply-To: <YEtKL70YWfv+yzyZ@pevik>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4AFFD4CEA9A0.AC5F4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.1 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] docparse: Unify Description and Algorithm
 titles
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

5LqOIDIwMjEvMy8xMiAxOTowMiwgUGV0ciBWb3JlbCDlhpnpgZM6Cj4gSGksCj4KPj4+ICAgCQkJ
CSMgZml4IGZvcm1hdHRpbmcgZm9yIGFzY2lpZG9jIFtET0NVTUVOVEFUSU9OXSA9PiAgKkRPQ1VN
RU5UQVRJT04qCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+PiAJCQkJCQkJCQkJICBU
aGlzCj4+IAkJCQkJCQkJCQkgIHNob3VsZAo+PiAJCQkJCQkJCQkJICBiZQo+PiAJCQkJCQkJCQkJ
ICAqRG9jdW1lbnRhdGlvbioKPj4+ICAgCQkJCWlmICgkZG9jID1+IHMvXlxbKC4qKVxdJC8kMS8p
IHsKPj4+IC0JCQkJCSRkb2MgPSBwYXJhZ3JhcGgoYm9sZCgkZG9jKSk7Cj4+PiArCQkJCQkkZG9j
ID0gcGFyYWdyYXBoKGJvbGQodWNmaXJzdChsYygkZG9jKSkpKTsKPj4+ICAgCQkJCX0KPj4+ICAg
CQkJCSRjb250ZW50IC49ICIkZG9jXG4iOwo+PiBPdGhlciB0aGFuIHRoYXQgaXQgbG9va3MgZ29v
ZC4KPiBUaGFua3MsIGZpeGVkIGFuZCBwYXRjaHNldCBtZXJnZWQuCj4KPiBZYW5nLCBzb3JyeSBJ
IGRpZG4ndCBwdXQgaXQgaW50byBkb2NwYXJzZS5jLgpIaSBQZXRyLAoKTmV2ZXIgbWluZCwgd2Ug
Y2FuIGRvIGl0IGxhdGVyIHdoZW4gc29tZW9uZSBuZWVkcyB0byB1bmlmeSB0aGVzZSB0aXRsZXMg
CmluIG1ldGFkYXRhLmpzb24uCgpCZXN0IFJlZ2FyZHMsClhpYW8gWWFuZwo+PiBSZXZpZXdlZC1i
eTogQ3lyaWwgSHJ1YmlzPGNocnViaXNAc3VzZS5jej4KPgo+IC4KPgoKCgoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

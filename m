Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E30D21B218B
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 10:27:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9DC663C29BD
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Apr 2020 10:27:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8F4F53C29A0
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 10:27:41 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 8F8372011B6
 for <ltp@lists.linux.it>; Tue, 21 Apr 2020 10:27:34 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,408,1580745600"; d="scan'208";a="89342854"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Apr 2020 16:27:26 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 79A9946B5FAE;
 Tue, 21 Apr 2020 16:16:51 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 21 Apr 2020 16:27:24 +0800
To: Li Wang <liwang@redhat.com>
References: <1586927503-10827-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1587022142-32122-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2dfPZs_DQxm33hsaYTXcsxddA0TTTMcbCuZgjekvCCGPA@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <0dcbceee-2f6f-86a5-9fce-765677bdbb2d@cn.fujitsu.com>
Date: Tue, 21 Apr 2020 16:27:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2dfPZs_DQxm33hsaYTXcsxddA0TTTMcbCuZgjekvCCGPA@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 79A9946B5FAE.A014B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] syscalls/pipe2_01: convert into new API
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgTGkKCj4gICAgIC19Cj4gICAgICtzdGF0aWMgc3RydWN0IHRjYXNlIHsKPiAgICAgK8KgIMKg
IMKgIMKgaW50IGZsYWdzOwo+ICAgICArwqAgwqAgwqAgwqBpbnQgY2hlY2tfY21kOwo+IAo+IAo+
IFRoZSAnY2hlY2tfY21kJyBzb3VuZHMgc3RyYW5nZSBoZXJlIHNpbmNlIHdlIGRvbid0IGRvIGFu
eSBjaGVjayBmb3IgdGhlIAo+IGNtZCwgY2FuIHdlIHVzZSAnY21kJyBkaXJlY3RseT8KWWVzLgo+
IAo+ICAgICArwqAgwqAgwqAgwqBpbnQgY2hlY2tfcmVhZF9zaWRlOwo+IAo+IAo+IEEgcGlwZSBo
YXMgYSByZWFkLWVuZCBhbmQgYSB3cml0ZS1lbmQuIFNvIEkgcHJlZmVyIHRvIGNhbGwgdGhpcyAK
PiAnY2hlY2tfcmVhZF9lbmQnLCBkbyB5b3UgYWdyZWU/CkFncmVlLiBtYW4tcGFnZXMgYWxzbyBz
YWlkICJ0aGUgcmVhZC93cml0ZSBlbmQgb2YgdGhlIHBpcGUiLiBUaGFua3MgZm9yIApwb2ludGlu
ZyBvdXQgdGhpcy4KPiAKPiAgICAgK8KgIMKgIMKgIMKgY2hhciAqbWVzc2FnZTsKPiAgICAgK30g
dGNhc2VzW10gPSB7CgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK

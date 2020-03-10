Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2815617EED2
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 03:51:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C2F3D3C6181
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 03:51:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 736293C613B
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 03:51:06 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 32D036010E3
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 03:51:04 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,535,1574092800"; d="scan'208";a="86082669"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Mar 2020 10:51:01 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id B832349DF12D;
 Tue, 10 Mar 2020 10:41:01 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 10 Mar 2020 10:50:56 +0800
To: Ronald Monthero <rmonther@redhat.com>, Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <CAGR3Yi6r+caUYV+yZYHGsuRUPQBbpsN_PJOTTSvHwE2VARy92g@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <7adf2e52-6960-584f-bef4-c0179ade342a@cn.fujitsu.com>
Date: Tue, 10 Mar 2020 10:50:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAGR3Yi6r+caUYV+yZYHGsuRUPQBbpsN_PJOTTSvHwE2VARy92g@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: B832349DF12D.AD476
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Fix build error because of undefined CAP_SYS_TIME
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

SGkgUm9uYWxkCgphY2tlZCwgYnV0IEkgdGhpbmsgd2UgY2FuIHNvcnQgdGhlbSBieSBudW0uCgpA
eGlhbywgY2FuIHlvdSBtZXJnZSB0aGlzIHBhdGNoPwoKQmVzdCBSZWdhcmRzCllhbmcgWHUKCj4g
RGV0YWlscyBvZiB0aGUgYnVpbGQgbG9nIGF0IHByIzY1NCAKPiBodHRwczovL2dpdGh1Yi5jb20v
bGludXgtdGVzdC1wcm9qZWN0L2x0cC9wdWxsLzY1NAo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvbmFs
ZCBNb250aGVybyA8cm1vbnRoZXJAcmVkaGF0LmNvbQo+IDxtYWlsdG86cm1vbnRoZXJAcmVkaGF0
LmNvbT4+Cj4gLS0tCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGFwaS9jYXBhYmlsaXR5LmggYi9p
bmNsdWRlL2xhcGkvY2FwYWJpbGl0eS5oCj4gaW5kZXggODgzM2YwNjA1Li44ZWQ2OGJmY2UgMTAw
NjQ0Cj4gLS0tIGEvaW5jbHVkZS9sYXBpL2NhcGFiaWxpdHkuaAo+ICsrKyBiL2luY2x1ZGUvbGFw
aS9jYXBhYmlsaXR5LmgKPiBAQCAtMjQsNiArMjQsMTAgQEAKPiAgwqAjIGRlZmluZSBDQVBfTkVU
X1JBVyDCoCDCoCDCoCDCoCDCoDEzCj4gIMKgI2VuZGlmCj4gCj4gKyNpZm5kZWYgQ0FQX1NZU19U
SU1FCj4gKyNkZWZpbmUgQ0FQX1NZU19USU1FIMKgIMKgIMKgIMKgIMKgMjUKPiArI2VuZGlmCj4g
Kwo+ICDCoCNpZm5kZWYgQ0FQX1NZU19BRE1JTgo+ICDCoCMgZGVmaW5lIENBUF9TWVNfQURNSU4g
wqAgwqAgwqAgwqAyMQo+ICDCoCNlbmRpZgo+IC0tLQo+IAo+IAoKCgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==

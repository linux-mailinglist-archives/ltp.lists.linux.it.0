Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB974DEEB
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 04:01:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D30E3EA8B1
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jun 2019 04:01:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 0E44B3EA113
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 04:01:37 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id C5D806019F0
 for <ltp@lists.linux.it>; Fri, 21 Jun 2019 04:01:36 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,398,1557158400"; d="scan'208";a="68327631"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 21 Jun 2019 10:01:34 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 13B0C4CE14EA;
 Fri, 21 Jun 2019 10:01:32 +0800 (CST)
Received: from [10.167.215.30] (10.167.215.30) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 21 Jun 2019 10:01:32 +0800
Message-ID: <5D0C3A79.7090504@cn.fujitsu.com>
Date: Fri, 21 Jun 2019 10:01:29 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20190515143746.GA7507@dell5510>
 <1557989579-3661-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190620114952.GA31382@dell5510>
In-Reply-To: <20190620114952.GA31382@dell5510>
X-Originating-IP: [10.167.215.30]
X-yoursite-MailScanner-ID: 13B0C4CE14EA.AFFAD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] security: add missing
 PR_CAPBSET_READ/PR_CAPBSET_DROP check
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Cj4gSGkgWWFuZywKPgo+PiBQUl9DQVBCU0VUX1JFQUQvUFJfQ0FQTlNFVF9EUk9QIHdhcyBhZGRl
ZCBzaW5jZSBsaW51eDIuNi4yNSwKPj4gY3VycmVudCBsdHAgZGV0ZWN0ZWQgdGhlbSBpbiBsdHAt
cHJjdGwubTQsIGJ1dCB0aHJlZSBwbGFjZXMKPj4gbWlzc2VkIHRoaXMgY2hlY2suIFNvIGFkZCBp
dCwgZml4IHBvc3NpYmxlIGNvbXBpbGVyIGVycm9yCj4+IG9uIHNvbWUgb2xkIGRpcnRyb3Mgd2l0
aG91dCBQUl9DQVBCU0VUX1JFQUQvUFJfQ0FQTlNFVF9EUk9QIGZsYWcuCj4gVGhhbmtzIGZvciB5
b3VyIHBhdGNoLCBtZXJnZWQuCj4KPiBCVFcgdGhlc2UgY2FwIGZpbGVzIHdvdWxkIGRlc2VydmUg
Y29udmVydGluZyBpbnRvIG5ldyBBUEkuCkhpIFBldHIKCk9rLiBJIHdpbGwgdGFrZSB0aGlzIGFz
IHRoZSBuZXh0IHBsYW4uCgo+IEtpbmQgcmVnYXJkcywKPiBQZXRyCj4KPgo+CgoKCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==

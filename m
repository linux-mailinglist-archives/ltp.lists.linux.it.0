Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB35FBD28
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 01:44:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 618603C2350
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Nov 2019 01:44:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6DC213C0737
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 01:44:29 +0100 (CET)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9EBFD1A01D14
 for <ltp@lists.linux.it>; Thu, 14 Nov 2019 01:44:25 +0100 (CET)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 16:44:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,302,1569308400"; d="scan'208";a="229942902"
Received: from shao2-debian.sh.intel.com (HELO [10.239.13.6]) ([10.239.13.6])
 by fmsmga004.fm.intel.com with ESMTP; 13 Nov 2019 16:44:20 -0800
To: Jan Stancek <jstancek@redhat.com>, Ian Kent <raven@themaw.net>
References: <20191111010022.GH29418@shao2-debian>
 <3fb8b1b04dd7808b45caf5262ee629c09c71e0b6.camel@themaw.net>
 <1108442397.11662343.1573560143066.JavaMail.zimbra@redhat.com>
 <20191112120818.GA8858@lst.de>
 <5f758be455bb8f761d028ea078b3e2a618dfd4b1.camel@themaw.net>
 <e38bc7a8505571bbb750fc0198ec85c892ac7b3a.camel@themaw.net>
 <975334005.11814790.1573625805426.JavaMail.zimbra@redhat.com>
From: Rong Chen <rong.a.chen@intel.com>
Message-ID: <d0db75cc-440d-6de8-f6d2-ddf399a3bdb7@intel.com>
Date: Thu, 14 Nov 2019 08:44:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <975334005.11814790.1573625805426.JavaMail.zimbra@redhat.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [xfs] 73e5fff98b: kmsg.dev/zero:Can't_open_blockdev
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
Cc: DavidHowells <dhowells@redhat.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 lkp@lists.01.org, AlViro <viro@ZenIV.linux.org.uk>,
 Christoph Hellwig <hch@lst.de>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

CgpPbiAxMS8xMy8xOSAyOjE2IFBNLCBKYW4gU3RhbmNlayB3cm90ZToKPgo+IC0tLS0tIE9yaWdp
bmFsIE1lc3NhZ2UgLS0tLS0KPj4+Pj4gIyBtb3VudCAtdCB4ZnMgL2Rldi96ZXJvIC9tbnQveGZz
Cj4+PiBBc3N1bWluZyB0aGF0IGlzIHdoYXQgaXMgYmVpbmcgZG9uZSAuLi4KPj4gQXJycmgsIG9m
IGNvdXJzZSwgYSBkaWZmZXJlbmNlIGJldHdlZW4gZ2V0X3RyZWVfYmRldigpIGFuZAo+PiBtb3Vu
dF9iZGV2KCkgaXMgdGhhdCBnZXRfdHJlZV9iZGV2KCkgcHJpbnRzIHRoaXMgbWVzc2FnZSB3aGVu
Cj4+IGJsa2Rldl9nZXRfYnlfcGF0aCgpIGZhaWxzIHdoZXJlYXMgbW91bnRfYmRldigpIGRvZXNu
J3QuCj4+Cj4+IEJvdGggaG93ZXZlciBkbyByZXR1cm4gYW4gZXJyb3IgaW4gdGhpcyBjYXNlIHNv
IHRoZSBiZWhhdmlvdXIKPj4gaXMgdGhlIHNhbWUuCj4+Cj4+IFNvIEknbSBjYWxsaW5nIHRoaXMg
bm90IGEgcHJvYmxlbSB3aXRoIHRoZSBzdWJqZWN0IHBhdGNoLgo+Pgo+PiBXaGF0IG5lZWRzIHRv
IGJlIGRvbmUgdG8gcmVzb2x2ZSB0aGlzIGluIGx0cCBJIGRvbid0IGtub3c/Cj4gSSB0aGluayB0
aGF0J3MgcXVlc3Rpb24gZm9yIGtlcm5lbCB0ZXN0IHJvYm90LCB3aGljaCBoYXMgdGhpcyBleHRy
YQo+IGNoZWNrIGJ1aWx0IG9uIHRvcC4gbHRwIGl0c2VsZiBkb2Vzbid0IHRyZWF0IHRoaXMgZXh0
cmEgbWVzc2FnZSBhcyBGQUlMLgo+Cj4gSmFuCj4KCkhpIGFsbCwKClRoYW5rcyBmb3IgeW91ciBo
ZWxwLCBrZXJuZWwgdGVzdCByb2JvdCBiaXNlY3RlZCBhdXRvbWF0aWNhbGx5IGZvciBuZXcgCmVy
cm9yOgoKIMKgwqAga2VybsKgIDplcnLCoMKgIDogW8KgIDEzNS45OTM5MTJdIC9kZXYvemVybzog
Q2FuJ3Qgb3BlbiBibG9ja2RldgoKUGxlYXNlIGlnbm9yZSB0aGUgcmVwb3J0IGlmIGl0J3Mgbm90
IGEgcHJvYmxlbS4KCkJlc3QgUmVnYXJkcywKUm9uZyBDaGVuCgotLSAKTWFpbGluZyBsaXN0IGlu
Zm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==

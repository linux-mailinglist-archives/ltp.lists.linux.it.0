Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAD31B58D6
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 12:12:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3DD183C2947
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Apr 2020 12:12:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 28B483C2920
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 12:12:40 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 8D5721A011C8
 for <ltp@lists.linux.it>; Thu, 23 Apr 2020 12:12:37 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,306,1583164800"; d="scan'208";a="89756403"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Apr 2020 18:12:34 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 45F4B50A9984;
 Thu, 23 Apr 2020 18:01:53 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 23 Apr 2020 18:12:30 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200409075506.GA2828@yuki.lan>
 <1586429086-22975-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1586429086-22975-9-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200422135856.GB5529@yuki.lan>
 <124d3b91-2025-d36e-f3b1-6c0b5528ae51@cn.fujitsu.com>
Message-ID: <9084aae3-e98a-918d-9a0d-bdbe7da76f87@cn.fujitsu.com>
Date: Thu, 23 Apr 2020 18:12:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <124d3b91-2025-d36e-f3b1-6c0b5528ae51@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 45F4B50A9984.AB514
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 09/10] syscalls/ioctl_loop07: Add dio with
 logic block size error test
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

SGkgQ3lyaWwKCj4gSGkgQ3lyaWwKPiAKPiAKPj4gSGkhCj4+IFRoaXMgdGVzdCBmYWlscyBmb3Ig
bWUsIGkuZS4gdGhlIGF0dGVtcHQgdG8gZW5hYmUgZGlyZWN0IElPIHN1Y2NlZWRzLiBJCj4+IHdp
bGwgaGF2ZSB0byBoYXZlIGEgY2xvc2VyIGxvb2sgbGF0ZXIgb24uCj4gTm93LCBJIHVzZSA1Ljcu
MC1yYzIga2VybmVsIHRvIHRlc3QsIHRoaXMgY2FzZSBmYWlscywgSSBndWVzcyBsb29wIAo+IGRy
aXZlciBoYXMgY2hhbmdlZCBpdHMgbG9naWMuIEkgYW0gdHJ5aW5nLgoKSSB3cml0ZSB0aGlzIHRl
c3Qgb24gZmVkb3JhMzEodG1wIGRpcmVjdG9yeSB1c2UgdG1wZnMpLCBzbyBJIGdvdCBhIApwc2V1
ZG8gcGFzcyB3aGVuIHNldHRpbmcgZGlvLgoKSSBtaXN1bmRlcnN0b29kIHRoZSBtZWFuaW5nIG9m
IHRoZSBjb21tZW50IGluIHRoZSBrZXJuZWwuCmtlcm5lbCBjb21tZXQgYXMgYmVsb3c6CiJXZSBz
dXBwb3J0IGRpcmVjdCBJL08gb25seSBpZiBsb19vZmZzZXQgaXMgYWxpZ25lZCB3aXRoIHRoZQps
b2dpY2FsIEkvTyBzaXplIG9mIGJhY2tpbmcgZGV2aWNlLCBhbmQgdGhlIGxvZ2ljYWwgYmxvY2sK
c2l6ZSBvZiBsb29wIGlzIGJpZ2dlciB0aGFuIHRoZSBiYWNraW5nIGRldmljZSdzIGFuZCB0aGUg
bG9vcApuZWVkbid0IHRyYW5zZm9ybSB0cmFuc2Zlci4iCgpzYl9ic2l6ZSA9IGJkZXZfbG9naWNh
bF9ibG9ja19zaXplKGlub2RlLT5pX3NiLT5zX2JkZXYpOyAgLy9nZXQgYmxvY2sgCnNpemUgZnJv
bSBiYWNraW5nIGRldmljZQpkaW9fYWxpZ24gPSBzYl9ic2l6ZSAtIDE7CgpJIHVzZSBsb2dpYyBi
bG9jayBzaXplIG9mIGxvb3AoMTAyNCA+IDUxMikgLCBzbyB0aGlzIHRlc3QgcGFzcy4KCk5vdywg
SSB0aGluayB0aGlzIHRlc3QgaXMgbWVhbmluZ2xlc3MgYW5kIHdlIGNhbiByZW1vdmUgdGhpcy4K
CkJlc3QgUmVnYXJkcwpZYW5nIFh1Cj4gCj4gcHM6IHdoZW4gcnVuIGlvY3RsX2xvb3AwMS5jLCBJ
IGFsc28gbWV0IGFub3RoZXIgcHJvYmxlbSB0aGF0IAo+IC9kZXYvbG9vcDBwMSBhbmTCoCB0aGUg
Y29ycmVzcG9uZGluZyBzeXMgZmlsZSBkb2Vzbid0IGV4aXN0ZWQuIGRtZXNnIAo+IHJlcG9ydCBl
cnJvciAibG9vcF9yZXJlYWRfcGFydGl0aW9uczogcGFydGl0aW9uIHNjYW4gb2YgbG9vcDAgKCkg
ZmFpbGVkIAo+IChyYz0tMTYpIi4gQWxzbyB0cnlpbmcgLgo+PgoKCgotLSAKTWFpbGluZyBsaXN0
IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==

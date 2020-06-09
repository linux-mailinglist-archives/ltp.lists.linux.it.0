Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 653411F385E
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 12:46:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 208153C2E4B
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 12:46:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 30B553C12D0
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 12:46:31 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id CFE4E20118B
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 12:46:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,491,1583164800"; d="scan'208";a="94165496"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 09 Jun 2020 18:46:28 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id AB90E4CE1C97;
 Tue,  9 Jun 2020 18:46:27 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 9 Jun 2020 18:46:26 +0800
To: Jan Stancek <jstancek@redhat.com>
References: <1591691583-12442-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <218497387.15286923.1591694653027.JavaMail.zimbra@redhat.com>
 <b1a7a025-3875-86db-222d-5a1e40737b24@cn.fujitsu.com>
 <1837993622.15296660.1591697802060.JavaMail.zimbra@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <96ba542d-4ec7-bc5d-41d9-f533952f94cd@cn.fujitsu.com>
Date: Tue, 9 Jun 2020 18:46:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1837993622.15296660.1591697802060.JavaMail.zimbra@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: AB90E4CE1C97.A10A6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05: Get the logic_block_size
 dynamically
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

SGkgSmFuCgo+IAo+IAo+IC0tLS0tIE9yaWdpbmFsIE1lc3NhZ2UgLS0tLS0KPj4gSGkgSmFuCj4+
Cj4+Pgo+Pj4gLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLQo+Pj4+IEluIGxvb3AgZHJpdmVy
IGNvZGUsIHRoZSBzYl9ic2l6ZSB3YXMgY2FsY3VsYXRlZCBhcyBiZWxvdwo+Pj4+IHNiX2JzaXpl
ID0gYmRldl9sb2dpY2FsX2Jsb2NrX3NpemUoaW5vZGUtPmlfc2ItPnNfYmRldiksCj4+Pj4KPj4+
PiBpdCBpcyB0aGUgc3VwZXIgYmxvY2sncyBibG9jayBzaXplIHRoYXQgdGhlIGJhY2tpbmcgZmls
ZSdzIGlub2RlIGJlbG9uZ3MKPj4+PiB0bywKPj4+PiBub3QgYnkgdXNpbmcgdGhlIHN0X2Jsa3Np
emUgbWVtYmVyIG9mIHN0YXQgc3RydWN0KGl0IHVzZXMKPj4+PiBpbm9kZS0+aV9ibGtiaXRzKS4K
Pj4+IEknbSBub3Qgc3VyZSBJIGZvbGxvdyB0aGUgYWJvdmUsIGFyZSB5b3Ugc2F5aW5nIHRoZSBk
aWZmZXJlbmNlIGlzIGJkZXYKPj4+IGJsa3NpemUKPj4+IHZzLiBmaWxlc3lzdGVtIGJsa3NpemU/
Cj4+Cj4+IEkgc2FpZCB0aGUgbG9vcCBkcml2ZXIgdXNlZCAgZGV2X2xvZ2ljYWxfYmxvY2tfc2l6
ZShpbm9kZS0+aV9zYi0+c19iZGV2KSBidXQKPj4gbm90IHVzaW5nCj4+IHN0X2Jsa3NpemUuCj4g
Cj4gSSBrbm93LCBidXQgSSdtIHRyeWluZyB0byB1bmRlcnN0YW5kIHdoYXQgdGhlIGRpZmZlcmVu
Y2UgaXMgYmV0d2VlbiB0aG9zZSB0d28uCkFGQUlLLCBzdF9ibGtzaXplIGlzIHVzZWQgdG8gc3Rh
bmRhcmQgaW8gaW4gdXNlciBzcGFjZSBhcyBtYW4tcGFnZSBzYWlkIAoiLyogQmxvY2sgc2l6ZSBm
b3IgZmlsZXN5c3RlbSBJL08gKi8iLCBpdCBtYXliZSBhIGJ1ZmZlciB3cml0ZSB1c2VkLiBJdCAK
aXMgYSAgYmxvY2sgc2l6ZSB0aGF0IGJsb2NrIGluIGlub2RlIHVzZWQuCkJ1dCBkZXZfbG9naWNh
bF9ibG9ja19zaXplIGlzIGEgbWluIHVuaXQgdGhhdHJlcXVlc3QgcXVldWUgdXNlZCBvbiBibG9j
ayAKbGF5ZXIuCgpwc++8miB0aGlzIGlzIG15IHVuZGVyc3RhbmRpbmcuIElmIGl0J3Mgd3Jvbmcs
IHBsZWFzZSBjb3JyZWN0IG1lLgo+IAo+Pj4gV291bGQgQkxLU1NaR0VUIHdvcms/IEl0IHJldHVy
bnMgYmRldl9sb2dpY2FsX2Jsb2NrX3NpemUoKS4KPj4KPj4gQnV0IGl0IG5lZWRzIGEgYmxvY2tk
ZXYsIGluIHVzZXIgc3BhY2UsIHdlIGNhbiBzcGVjaWZ5IGJkZXYsIGJ1dCBob3cgY2FuIHdlCj4+
IGZpZ3VyZSBvdXQgdGhpcyBpbm9kZS0+aV9zYi0+c19iZGV2IGJsb2NrIGRldi4KPiAKPiBJc24n
dCB0aGF0IHRoZSBibG9jayBkZXZpY2UgInRlc3QuaW1nIiBpcyBvbj8KRG8geW91IG1lYW4gdGhl
IHRlc3QuaW1nIGJlbG9uZyB0byBzb21lIGJsb2NrIGRldiwgc3VjaCBhcyAvZGV2L3NkYTEgb3Ig
Cm91ciBtb3VudGVkIGJsb2NrX2Rldj8gSWYgc28sIEkgdGhpbmsgaXQgaXMuCj4gCj4gCj4gCgoK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

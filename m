Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD031F611A
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 06:56:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 412E43C2DE8
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 06:56:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 5396D3C0887
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 06:56:42 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 8FBF96014F0
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 06:56:40 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,498,1583164800"; d="scan'208";a="94282064"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Jun 2020 12:56:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 16A184CE281F;
 Thu, 11 Jun 2020 12:56:37 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 11 Jun 2020 12:56:37 +0800
To: Jan Stancek <jstancek@redhat.com>
References: <828833321.15301509.1591700517554.JavaMail.zimbra@redhat.com>
 <1591767427-29383-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1904123764.15455071.1591784009893.JavaMail.zimbra@redhat.com>
 <787d0f86-269b-1e23-2631-2c420d6dd884@cn.fujitsu.com>
 <3cdd6be2-c27a-e9dc-2559-c6577239a1bc@cn.fujitsu.com>
 <660069492.15476972.1591794243308.JavaMail.zimbra@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <4c75396e-6578-ecbb-e8e5-d0569d289f9f@cn.fujitsu.com>
Date: Thu, 11 Jun 2020 12:56:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <660069492.15476972.1591794243308.JavaMail.zimbra@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 16A184CE281F.AF8F2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/ioctl_loop05: Use correct blockdev to
 get logical_block_size
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

SGkgSmFuCgoKPiAKPiAKPiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4+Pj4KPj4+PiBX
aGF0IEkgaGFkIGluIG1pbmQgd2hlbiBJIHJlZmVycmVkIHRvIGRmIHdhcyBzb21ldGhpbmcgbGlr
ZToKPj4+PiAgwqDCoCBzdGF0KCJ0ZXN0LmltZyIsICZzdGF0YnVmKTsKPj4+PiAgwqDCoCBTQUZF
X01LTk9EKCJibGtkZXYiLCBTX0lGQkxLIHwgU19JUldYVSwgc3RhdGJ1Zi5zdF9kZXYpOwo+Pj4+
ICDCoMKgIGJsb2NrX2RldmZkID0gU0FGRV9PUEVOKCJibGtkZXYiLCBPX1JEV1IpOwo+Pj4+IFdo
YXQgZG8geW91IHRoaW5rPwo+Pj4+Cj4+IEl0IHdvcmtzIHdlbGwgb24gZXh0NCBvciB4ZnMgZmls
ZXN5c3RlbSh1c2VyIG1heSBtb3VudCB3YW50ZWQgZmlsZXN5c3RlbQo+PiBvbiB0bXBkaXIpLiBC
dXQgaWYgd2UgdXNlIGJ0cmZzLCB0aGlzCj4+IEJMS1NTWkdFVCB3aWxsIGZhaWwgYmVjYXVzZSBt
YWpvciBkZXYgbnVtZXIgaXMgMC4gV2hlbiB3ZSBtZWV0IHRoaXMKPj4gc2l0dWF0aW9uLCB3ZSBk
b24ndCBuZWVkIHRvIGNhbGwgdGhpcyBpb2N0bCBhbmQgd2UgY2FuIGRpcmVjdGx5IHRlc3QKPj4g
YmVjdWFzZSBpdCBkb2VzbicgdCBoYXZlIGJhY2tpbmcgZmlsZSBibG9jayBkZXZpY2UgYWxpZ24g
bGltaXQuCj4+IFdoYXQgZG8geW91IHRoaW4gYWJvdXQgaXQ/Cj4gCj4gVGhpcyBJIGRpZG4ndCBl
eHBlY3QuIElmIGl0J3Mgbm90IHJlbGlhYmxlIHRoZW4gcGVyaGFwcyB5b3VyIG1ldGhvZAo+IGlu
IHYxIHRoYXQgaW5jcmVtZW50YWxseSBpbmNyZWFzZXMgaXQgdW50aWwgaXQgd29ya3MgaXMgcGVy
aGFwcyBtb3N0Cj4gdW5pdmVyc2FsIGFwcHJvYWNoLiBTb3JyeSBmb3IgdGhlIGRldG91ciB0byBn
ZXQgdGhlcmUuCj4gCkFmdGVyIEkgdHJhY2UgdGhlIHN0YXQgc3lzY2FsbCwgYnRyZnMgdXNlcyB2
aXJ0dWFsIGJsb2NrIGRldiwgc28gbWFqb3IgCmRldiBudW1iZXIgaXMgMCBzaW5jZSBrZXJuZWwg
Y29tbWl0WzFdLgoKT3JpZ2luYWxseSwgSSB3YW50IHRvIHVzZSB0aGF0IG1ham9yIGRldiBudW1i
ZXIgaXMgMCB0byBqdWRnZSB3aGV0aGVyIApsb29wIGRyaXZlciBoYXMgYWxpZ24gbGltaXQgb24g
c29tZSBmaWxleXN0ZW1zLiBCdXQgaXQgc2VlcyB0aGF0IHRoZXkgCmRvbid0IGhhdmUgZGlyZWN0
IGNvbm5lY3Rpb24gYmV0d2VlbiBpbm9kZS0+aV9zYi0+c19iZGV2IChsb29wIHVzZWQpYW5kIApp
bm9kZS0+c3RfZGV2KHN0YXQgdXNlZCkuIFNvIHVzaW5nIHRoZSBtYWpvciBkZXYgbnVtYmVyIHRv
IGp1ZGdlIHdoZXRoZXIgCmxvb3AgZHJpdmVyIGNvZGUgaGFzIGFsaWduIGxpbWl0cyBzb3VuZHMg
dW5yZWFzb25hYmxlLgoKVG8gYW92aWQgdGhpcywgSSB3aWxsIHVzZSB2MSBtZXRob2Qgd2l0aCBz
b21lIGltcHJvdmVtZW50LgoKClsxXWh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvZnMvYnRyZnMvaW5vZGUuYz9p
ZD0zMzk0ZTE2MDdlYWY4NzBlYmJhMzdkMzAzZmJkNTkwYTRjNTY5OTA4IAoKPiAKPiAKCgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

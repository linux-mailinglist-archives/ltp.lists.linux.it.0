Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 906201D0F99
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 12:21:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BE973C54FE
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 12:21:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 6EAB83C25D1
 for <ltp@lists.linux.it>; Wed, 13 May 2020 12:21:29 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 9BD12600B88
 for <ltp@lists.linux.it>; Wed, 13 May 2020 12:21:26 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,387,1583164800"; d="scan'208";a="92000504"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 May 2020 18:21:08 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 5748550A999D;
 Wed, 13 May 2020 18:21:08 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 May 2020 18:21:07 +0800
Message-ID: <5EBBCA12.5020901@cn.fujitsu.com>
Date: Wed, 13 May 2020 18:21:06 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
 <5EBB5B3D.4020302@cn.fujitsu.com> <20200513092028.GA4598@dell5510>
In-Reply-To: <20200513092028.GA4598@dell5510>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 5748550A999D.A9C74
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMjAyMC81LzEzIDE3OjIwLCBQZXRyIFZvcmVsIHdyb3RlOgo+IEhpIFlhbmcsCj4KPj4gRm9y
IHRoZSBwYXRjaCBzZXQsIEkgYW5kIFZpcmVzaCBoYXZlIHRoZSBmb2xsb3dpbmcgZG91YnRzIHNv
IGRvIHlvdSBoYXZlIGFueQo+PiBzdWdnZXN0aW9uIGFib3V0IHRoZW0/Cj4+IDEpIEkga2VlcCBU
RVNUKCkgaW4gcGlkZmRfb3BlbjAxL3BpZGZkX29wZW4wMyBmb3Igbm93IGJ1dCBJIHRoaW5rIGl0
IGlzCj4+ICAgICBzdXJwbHVzIGJlY2F1c2UgcGlkZmQvZmQgYW5kIFRFUlJOTyBhcmUgZW5vdWdo
IHRvIGNoZWNrIHJldHVybiB2YWx1ZQo+PiAgICAgYW5kIGVycm5vLgo+PiAgICAgSSB3b25kZXIg
aWYgaXQgaXMgbmVjZXNzYXJ5IHRvIGtlZXAgVEVTVCgpPwo+Cj4geWVzLCBJJ3ZlIG5vdGljZWQg
eW91ciBkaXNjdXNzaW9uIGF0IHYxLCBzb3JyeSBJIHdhc24ndCBhYmxlIHRvIGZvbGxvdy4KPiBo
dHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbHRwL3BhdGNoLzIwMjAwNDMwMDg1
NzQyLjE2NjMtMS15YW5neC5qeUBjbi5mdWppdHN1LmNvbS8KPiBKdXN0IHRvIGdldCBjb250ZXh0
LCBXZSdyZSB0YWxraW5nIGFib3V0IHBhcnQgb2YgdGhlIGNoYW5nZXMgYmV0d2VlbiB2MSBhbmQg
djI6Cj4KPiArKysgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3BpZGZkX29wZW4vcGlkZmRf
b3BlbjAzLmMKPiBAQCAtMjcsOSArMjcsMTEgQEAgc3RhdGljIHZvaWQgcnVuKHZvaWQpCj4gICAg
ICAgICAgICAgICAgICBleGl0KEVYSVRfU1VDQ0VTUyk7Cj4gICAgICAgICAgfQo+Cj4gLSAgICAg
ICBmZCA9IHBpZGZkX29wZW4ocGlkLCAwKTsKPiArICAgICAgIFRFU1QocGlkZmRfb3BlbihwaWQs
IDApKTsKPiArCj4gKyAgICAgICBmZCA9IFRTVF9SRVQ7Cj4gICAgICAgICAgaWYgKGZkID09IC0x
KQo+IC0gICAgICAgICAgICAgICB0c3RfYnJrKFRGQUlMIHwgVEVSUk5PLCAicGlkZmRfb3Blbigp
IGZhaWxlZCIpOwo+ICsgICAgICAgICAgICAgICB0c3RfYnJrKFRGQUlMIHwgVFRFUlJOTywgInBp
ZGZkX29wZW4oKSBmYWlsZWQiKTsKPgo+ICAgICAgICAgIFRTVF9DSEVDS1BPSU5UX1dBS0UoMCk7
Cj4KPiBJIGhhdmVuJ3QgZm91bmQgQ3lyaWwncyByZXF1ZXN0IHRvIHVzZSBURVNUKCkuIFRvIGJl
IGhvbmVzdCwgbm90IHN1cmUgaWYgaXQgd2FzCj4gbWVhbnQgdG8gbWFrZSBzdXJlIHRoYXQgZXJy
bm8gbmVlZHMgdG8gYmUgcmVzZXQgYmVmb3JlICh3aGljaCBURVNUKCkpIGRvZXMuCj4gSWYgbm90
LCB1c2luZyBwaWRmZF9vcGVuKCkgZGlyZWN0bHkgd291bGQgYmUgb2sgZm9yIG1lLgpIaSBQZXRy
LAoKVGhhbmtzIGEgbG90IGZvciB5b3VyIHF1aWNrIHJlcGx5LgoKUmVzZXR0aW5nIGVycm5vIG1h
eSBub3QgbmVjZXNzYXJ5IGJlY2F1c2UgZXJybm8gd2lsbCBiZSBzZXQgYWdhaW4gd2hlbgpmZCA9
PSAtMS4KCj4KPgo+PiAyKSB0c3Rfc3lzY2FsbCgpIGlzIGVub3VnaCB0byBjaGVjayB0aGUgc3Vw
cG9ydCBvZiBwaWRmZF9vcGVuKCkgYW5kIEkKPj4gICAgIGRvbid0IHdhbnQgdG8gZGVmaW5lIGNo
ZWNrIGZ1bmN0aW9uIGFzIGZzb3Blbl9zdXBwb3J0ZWRfYnlfa2VybmVsKCkKPj4gICAgIGRvZXMu
Cj4+ICAgICBEbyB5b3UgdGhpbmsgc28/Cj4KPj4gQlRXOgo+PiBJIGRvbid0IGxpa2UgdGhlIGlt
cGxlbWVudGF0aW9uIG9mIGZzb3Blbl9zdXBwb3J0ZWRfYnlfa2VybmVsKCk6Cj4+IGEpIHN5c2Nh
bGwoKS90c3Rfc3lzY2FsbCgpIGlzIGVub3VnaCB0byBjaGVjayB0aGUgc3VwcG9ydCBvZgo+PiBw
aWRmZF9vcGVuKDIpIGFuZCAndHN0X2t2ZXJjbXAoNSwgMiwgMCkpPCAgMCcgd2lsbCBza2lwIHRo
ZSBjaGVjayBpZgo+ICsxIGZvciB0c3Rfc3lzY2FsbCgpCj4KPj4gYSBrZXJuZWwgb24gZGlzdHJp
YnV0aW9uIGlzIG5ld2VyIHRoYW4gdjUuMiBidXQgZHJvcCB0aGUgc3VwcG9ydCBvZgo+PiBwaWRm
ZF9vcGVuKDIpIG9uIHB1cnBvc2UuCj4gImRyb3Agc3VwcG9ydCBvZiBwaWRmZF9vcGVuKDIpIG9u
IHB1cnBvc2UiOiB3b3VsZCBhbnlib2R5IGhhcyBhIHJlYXNvbiB0byBkbwo+IHRoYXQ/CgpBcyBt
eSBwZXJ2aW91cyBtYWlsIHNhaWQsIEl0IGlzIGp1c3QgYSBwb3NzaWJsZSBzaXR1YXRpb27vvIwg
Zm9yIGV4YW1wbGU6ClVwc3RyZWFtIGtlcm5lbCBpbnRyb2R1Y2VzIGJ0cmZzIGZpbGVzeXN0ZW0g
bG9uZyBsb25nIGFnbyBidXQgdGhlCmtlcm5lbCBvZiBSSEVMOCBkcm9wcyBidHJmcyBmaWxlc3lz
dGVtIGJlY2F1c2Ugb2Ygc29tZSByZWFzb25zLgoKSXQgaXMganVzdCBhIHJlYXNvbiB1c2VkIHRv
IGV4cGxhaW4gd2h5IEkgd2FudCB0byBkcm9wIHRoZSBrZXJuZWwgCnZlcnNpb24gY2hlY2suCgo+
Cj4+IGIpIHRzdF9zeXNjYWxsKCkgaGFzIGNoZWNrZWQgRU5PU1lTIGVycm9yIHNvIHdlIGNhbiBz
aW1wbGUKPj4gZnNvcGVuX3N1cHBvcnRlZF9ieV9rZXJuZWwoKSBieSByZXBsYWNpbmcgc3lzY2Fs
bCgpIHdpdGggdHN0X3N5c2NhbGxzKCkuCj4KPiBXZWxsLCBvbmUgb2YgdGhlIGJlbmVmaXRzIG9m
IGZzb3Blbl9zdXBwb3J0ZWRfYnlfa2VybmVsKCkgd2FzIHRvIHJlZHVjZSBhIGJpdCBvZgo+IGR1
cGxpY2l0eS4gRXZlbiBpZiB0aGUgaW1wbGVtZW50YXRpb24gaXMgbGlrZSBURVNUIGFuZCBTQUZF
X0NMT1NFKCksIGl0J3MKPiBhIGZld2VyIGxpbmVzICgrIGZ1bmN0aW9uIG5hbWUgYXMgYSBzZWxm
IGRvY3MpLgo+Cj4gdm9pZCBmc29wZW5fc3VwcG9ydGVkX2J5X2tlcm5lbCh2b2lkKQo+IHsKPiAJ
VEVTVCh0c3Rfc3lzY2FsbChfX05SX2Zzb3BlbiwgTlVMTCwgMCkpOwo+IAlpZiAoVFNUX1JFVCAh
PSAtMSkKPiAJCVNBRkVfQ0xPU0UoVFNUX1JFVCk7Cj4gfQo+Cj4gRm9yIHlvdXIgY2hhbmdlIGZv
ciBwaWRmZF9vcGVuMDMuYzoKPgo+IHN0YXRpYyB2b2lkIHNldHVwKHZvaWQpCj4gewo+IAlpbnQg
cGlkZmQgPSAtMTsKPgo+IAkvLyBDaGVjayBpZiBwaWRmZF9vcGVuKDIpIGlzIG5vdCBzdXBwb3J0
ZWQKPiAJcGlkZmQgPSB0c3Rfc3lzY2FsbChfX05SX3BpZGZkX29wZW4sIGdldHBpZCgpLCAwKTsK
PiAJaWYgKHBpZGZkICE9IC0xKQo+IAkJU0FGRV9DTE9TRShwaWRmZCk7Cj4gfQo+Cj4gICBzdGF0
aWMgc3RydWN0IHRzdF90ZXN0IHRlc3QgPSB7Cj4gLSAgICAgICAubWluX2t2ZXIgPSAiNS4zIiwK
PiArICAgICAgIC5zZXR1cCA9IHNldHVwLAo+Cj4gSG93IGFib3V0IHRvIGNhbGwgdGhlIGZ1bmN0
aW9uIHBpZGZkX29wZW5fc3VwcG9ydGVkX2J5X2tlcm5lbCgpPwoKT0sKCj4gVGhhbiB5b3UgY2Fu
IHJlbW92ZSB0aGUgY29tbWVudCAod2hpY2ggQlRXIHNob3VsZCB1c2UgQyBzdHlsZSAvKiAqLyku
CgpPSwoKPiBBbmQgSU1ITyB5b3UgZG9uJ3QgaGF2ZSB0byBhc3NpZ24gcGlkZmQgdG8gLTEuCgpJ
biBwaWRmZF9vcGVuX3N1cHBvcnRlZF9ieV9rZXJuZWwoKSwgZG8geW91IHdhbnQgdG8gZHJvcCAn
cGlkZmQgPSAtMScgCmRpcmVjdGx5IG9yIGRyb3AgJ3BpZGZkID0gLTEnIGJ5IHVzaW5nIFRFU1Qo
KT8KCkJlc3QgUmVnYXJkcywKWGlhbyBZYW5nCj4KPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+Cj4K
PiAuCj4KCgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK

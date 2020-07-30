Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DADE523300E
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 12:09:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C53E3C2620
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 12:09:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 58DB83C0515
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 12:09:20 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 05A3A1000B7F
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 12:09:19 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,414,1589212800"; d="scan'208";a="97108008"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Jul 2020 18:08:58 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A62F54CE506F;
 Thu, 30 Jul 2020 18:08:56 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 30 Jul 2020 18:08:57 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200722125946.GA22573@yuki.lan>
 <1595556357-29932-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1595556357-29932-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200729113946.GB7152@yuki.lan>
 <924c3fc1-c56c-a752-0720-bb12d6cf8ec0@cn.fujitsu.com>
 <20200730092802.GA3457@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <8d7cf7a7-1408-877c-05f2-e5566d7717d1@cn.fujitsu.com>
Date: Thu, 30 Jul 2020 18:08:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730092802.GA3457@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A62F54CE506F.AE2CA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-0.5 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/2] syscalls/ioctl_loop05: Using
 LOOP_CONFIGURE to set direct io
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SEkgQ3lyaWwKPiBIaSEKPj4+IFNvIEkgZ3Vlc3MgdGhhdCB3ZSB3aWxsIGhhdmUgdG8gd3JpdGUg
YSBwYXJzZXIgdGhhdCByZWFkcyB0aGF0Cj4+PiBpbmZvcm1hdGlvbiBsaW5lIGJ5IGxpbmUgYWZ0
ZXIgYWxsLgo+PiBJIGRvdWJ0IGhvdyBtYWNoaWVzIHdpbGwgaGF2ZSBtb3JlIG9yIHplcm8gZmll
bGRzIGluICg3KS4gQnV0IEkgdGhpbmsKPj4geW91IGFyZSByaWdodCwKPiAKPiBXZWxsIHRoYXQn
cyB3aGF0IEkgZG8gaGF2ZSBoZXJlLgo+IAo+PiBIb3cgYWJvdXQgdXNpbmcgdGhlICgzKSBmaWVs
ZCBhbmQgc2Vjb25kIHRvIGxhc3QgZmllbGQuIFRoZW4gd2UgY2FuCj4+IGF2b2lkIHplcm8gb3Ig
bW9yZSBmaWxlZCBpbiAoNykuIHRoZSBjb2RlIGFzIGJlbG93Pz8KPiAKPiBBY3R1YWxseSBsb29r
aW5nIGludG8gdXRpbC1saW51eCBjb2RlIGl0IHNheXMgdGhhdCB0aCB0aGUgb3B0aW9uYWwKPiBm
aWVsZHMgYXJlIHRlcm1pbmF0ZWQgd2l0aCAiIC0gIiwgc2VlOgo+IAo+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS91dGlscy91dGlsLWxpbnV4L3V0aWwtbGludXguZ2l0L3RyZWUvbGli
bW91bnQvc3JjL3RhYl9wYXJzZS5jI24xNzcKPiAKPiBTbyBJIGd1ZXNzIHRoZSBzYWZlc3Qgb3B0
aW9uIHdvdWxkIGJlOgo+IAo+ICogTWF0Y2ggdGhlIGxpbmUgYnkgbWFqb3I6bWlub3IgYXMgeW91
IGRvCj4gKiBUaGVuIHN0cnN0cigpIGZvciAiIC0gIiBzaG91bGQgbGFuZCB1cyBkaXJlY3RseSB0
byBmaWVsZCAoOCkKWWVzLCB1c2luZyAiIC0gIiBtb3JlIGVhc2lseSBhbmQgZmFzdGVyLiBjb2Rl
IGFzIGJlbG93o7oKCmluZGV4IDhkOGJjNWI0MC4uYmRkOTNmMTllIDEwMDY0NAotLS0gYS9saWIv
dHN0X2RldmljZS5jCisrKyBiL2xpYi90c3RfZGV2aWNlLmMKQEAgLTQ5NywxNyArNDk3LDMwIEBA
IHVuc2lnbmVkIGxvbmcgdHN0X2Rldl9ieXRlc193cml0dGVuKGNvbnN0IGNoYXIgKmRldikKCiAg
dm9pZCB0c3RfZmluZF9iYWNraW5nX2Rldihjb25zdCBjaGFyICpwYXRoLCBjaGFyICpkZXYpCiAg
ewotICAgICAgIGNoYXIgZm10WzEwMjRdOworICAgICAgIGNoYXIgZm10WzIwXTsKICAgICAgICAg
c3RydWN0IHN0YXQgYnVmOworICAgICAgIEZJTEUgKmZpbGU7CisgICAgICAgY2hhciBsaW5lW1BB
VEhfTUFYXTsKKyAgICAgICBjaGFyICpwcmUgPSBOVUxMOworICAgICAgIGNoYXIgKm5leHQgPSBO
VUxMOwoKICAgICAgICAgaWYgKHN0YXQocGF0aCwgJmJ1ZikgPCAwKQogICAgICAgICAgICAgICAg
ICB0c3RfYnJrbShUV0FSTiB8IFRFUlJOTywgTlVMTCwgInN0YXQoKSBmYWlsZWQiKTsKCi0gICAg
ICAgc25wcmludGYoZm10LCBzaXplb2YoZm10KSwgIiUlKmkgJSUqaSAldToldSAlJSpzICUlKnMg
JSUqcyAlJSpzIAolJSpzICUlKnMgJSVzICUlKnMiLAotICAgICAgICAgICAgICAgICAgICAgICBt
YWpvcihidWYuc3RfZGV2KSwgbWlub3IoYnVmLnN0X2RldikpOworICAgICAgIHNucHJpbnRmKGZt
dCwgc2l6ZW9mKGZtdCksICIldToldSIsIG1ham9yKGJ1Zi5zdF9kZXYpLCAKbWlub3IoYnVmLnN0
X2RldikpOworICAgICAgIGZpbGUgPSBTQUZFX0ZPUEVOKE5VTEwsICIvcHJvYy9zZWxmL21vdW50
aW5mbyIsICJyIik7CgotICAgICAgIFNBRkVfRklMRV9MSU5FU19TQ0FORihOVUxMLCAiL3Byb2Mv
c2VsZi9tb3VudGluZm8iLCBmbXQsIGRldik7CisgICAgICAgd2hpbGUgKGZnZXRzKGxpbmUsIHNp
emVvZihsaW5lKSwgZmlsZSkpIHsKKyAgICAgICAgICAgICAgIGlmIChzdHJzdHIobGluZSwgZm10
KSAhPSBOVUxMKSB7CisgICAgICAgICAgICAgICAgICAgICAgIHByZSA9IHN0cnN0cihsaW5lLCAi
IC0gIik7CisgICAgICAgICAgICAgICAgICAgICAgIHByZSA9IHN0cnRva19yKHByZSwgIiAiLCAm
bmV4dCk7CisgICAgICAgICAgICAgICAgICAgICAgIHByZSA9IHN0cnRva19yKE5VTEwsICIgIiwg
Jm5leHQpOworICAgICAgICAgICAgICAgICAgICAgICBwcmUgPSBzdHJ0b2tfcihOVUxMLCAiICIs
ICZuZXh0KTsKKyAgICAgICAgICAgICAgICAgICAgICAgc3RyY3B5KGRldiwgcHJlKTsKKyAgICAg
ICAgICAgICAgIH0KKyAgICAgICB9CgorICAgICAgIFNBRkVfRkNMT1NFKE5VTEwsIGZpbGUpOwog
ICAgICAgICBpZiAoc3RhdChkZXYsICZidWYpIDwgMCkKICAgICAgICAgICAgICAgICAgdHN0X2Jy
a20oVFdBUk4gfCBURVJSTk8sIE5VTEwsICJzdGF0KCVzKSBmYWlsZWQiLCBkZXYpOwoKCj4gCgoK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

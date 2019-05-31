Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B363030E7C
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 15:03:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8DFCC39028D
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 15:03:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 15791390272
 for <ltp@lists.linux.it>; Fri, 31 May 2019 15:02:59 +0200 (CEST)
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B98BB60212D
 for <ltp@lists.linux.it>; Fri, 31 May 2019 15:02:58 +0200 (CEST)
Received: by mail-yb1-xb44.google.com with SMTP id x187so942307ybc.11
 for <ltp@lists.linux.it>; Fri, 31 May 2019 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=b+nAlstTp4IUuCrOxDw9q771zc3bJTzh5ESIXUINFF0=;
 b=abHQlb5sGSgFJTMZbi+hfAM5fIubwoXgiUWp5XWx2jtfPemjXaA90A9mo50zHDMehK
 EPY0z0JZGg7pciW5irHAHFjRajdzFwwKD/5pATfhHkXAWMA7eH9iZUHGXMQmTaX1r5k4
 BB6Y9SrXtY553OuYAhRTuQ5OQranBRgbdJZCptM6hy8e3V9IgBZztVNNR/HuOxt40ZNl
 GXPD5jh1Wak/NbA1oeU1SVv3oxZT5BUk4sPnwBsf29w6alP1OOSn3yuwZizHIZL6uxXS
 MdLMnEfeLKud9TMlgRM5MuSw0I0EdhllEIU1sl+TIjmkg2raE9Cs1avnSXqMCMvwcEHG
 +6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=b+nAlstTp4IUuCrOxDw9q771zc3bJTzh5ESIXUINFF0=;
 b=lud7cIfUTVW2NzdvBr7hmkM/YifKQvB0dOo4ZebSfxiTi4kJVSxOo5gMc75e/ZIWlP
 HuoKl4+DvgI2oCKiKRSg+48/hmWk02mFQez3EVXv3+H3uWocwp+UyvRiwtXpgQ3azYG9
 mZmoXRbPvhNdsVYmN65rLsIDQH0ZVY8ItkEAKwPv3c6iVJdmNd0I/R5ab6YfpdD/15ec
 tvt0DfyrLsjvAOwJEoYsdVWyqnjiKRdxBiHMxxWo936IlrVyAtNh35VVM6A0F2pRXnV7
 KH12FEYL6HyNS+Ykgy4oQJ1QBbC/sbXenpit54f4tOna6f8iOSxMPNWpewMBl/hYqAve
 +acg==
X-Gm-Message-State: APjAAAWnA08IvWoto0wYCDpR8jWUI4VlHzizX1rXZDcriKfRCclZFwL4
 ZHcauNANBK89rtVjwitdK0eAOqGR0zcGmscZZwM=
X-Google-Smtp-Source: APXvYqyYJAgJ90E743DB2V1RNcW+zolWnQjK8R6HCCmCxbKLthhHyMW1S5oIBesUo8tYLRuaSMdDfuSOXgIE9zTs5O0=
X-Received: by 2002:a25:a081:: with SMTP id y1mr4690484ybh.428.1559307777274; 
 Fri, 31 May 2019 06:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <1559292243-2882-1-git-send-email-huangjh.jy@cn.fujitsu.com>
 <5CF0FEB5.4030700@cn.fujitsu.com>
 <CAEemH2erJkdcKU_qg8RsjWUf7A37wj1QgMv=UZ21xUy=vXq9rg@mail.gmail.com>
In-Reply-To: <CAEemH2erJkdcKU_qg8RsjWUf7A37wj1QgMv=UZ21xUy=vXq9rg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 31 May 2019 16:02:45 +0300
Message-ID: <CAOQ4uxjE6RC_60SR0KZk7dJvU12pxPXEq56-tz840rDCQth1Xg@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02.c: Compatible with new
 and old kernels
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgMzowMyBQTSBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNv
bT4gd3JvdGU6Cj4KPgo+Cj4gT24gRnJpLCBNYXkgMzEsIDIwMTkgYXQgNjoxNSBQTSBYaWFvIFlh
bmcgPHlhbmd4Lmp5QGNuLmZ1aml0c3UuY29tPiB3cm90ZToKPj4KPj4gT24gMjAxOS8wNS8zMSAx
Njo0NCwgSmluaHVpIGh1YW5nIHdyb3RlOgo+PiA+IE9uIG5ldyBrZXJuZWxzLCBjb3B5X2ZpbGVf
cmFuZ2UoKSByZXR1cm5lZCBFSVNESVIgd2hlbiBjb3B5ZWQgY29udGVudHMKPj4gPiB0byBkaXJl
Y3RvcnksIGJ1dCBvbiBvbGQga2VybmVscywgaXQgcmV0dXJuZWQgRUJBREYsIHdlIHNob3VsZCBh
Y2NlcHQKPj4gPiBFQkFERiB0byBiZSBjb21wYXRpYmxlIHdpdGggbmV3IGFuZCBvbGQga2VybmVs
cy4KPj4gPgo+PiA+IFRoZSBwYXRjaCBhcyBmb2xsb3dzOgo+PiA+IGNvbW1pdCAxMWNiZmIxMDc3
NWEgKCJ2ZnM6IGRlbnkgY29weV9maWxlX3JhbmdlKCkgZm9yIG5vbiByZWd1bGFyIGZpbGVzIikK
Pj4gSGksCj4+Cj4+IEZyb20gZGVzY3JpcHRpb24gb2YgY29tbWl0LCBJIHdvbmRlciBpZiB3ZSBj
YW4gYWRkIG1vcmUgdGVzdHMgZm9yIHNvbWUKPj4gbm9uIHJlZ3VsYXIgZmlsZXMoZS5nLiBibG9j
aywgcGlwZSk/Cj4KPgo+IEkgaGF2ZSBubyBvYmplY3Rpb24gb24gdGhpcy4gQnV0LCBpcyB0aGVy
ZSByZWFsbHkgbWFrZSBzZW5zZSB0byB0ZXN0IHNvbWUgbW9yZSBub24gcmVndWxhciBmaWxlcyB3
aGljaCBub3QgYmVpbmcgbWVudGlvbmVkIGJ5IExpbnV4IE1hbnVhbCBQYWdlPwo+CgpGWUksIG1v
cmUgY2hhbmdlcyB0byBjb3B5X2ZpbGVfcmFuZ2UgY2hlY2tzIGFyZSBpbiB0aGUgd29ya3M6Cmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWZzZGV2ZWwvMjAxOTA1MjYwNjExMDAuMjE3NjEt
MS1hbWlyNzNpbEBnbWFpbC5jb20vVC8jbWUzNGQ0MzYzNDQ5MTE4YmQzYjJlYzg0MjFkMjgyYTc3
ZTlhN2QyZDEKCj4gVGhlIGNvcHlfZmlsZV9yYW5nZTAyIHRlc3QgZXJyb3JzIGFyZSBhbGwgZXh0
cmFjdCBmcm9tIG1hbnVhbCBwYWdlLCBJIGNvbW1lbnRlZCB0aGF0IGluIENocmlzdGlhbidzIGZp
cnN0IHBhdGNoIHZlcnNpb24uIEFuZCBJIGRvbid0IHRoaW5rIGl0J3MgbmVjZXNzYXJ5IHRvIHRl
c3QgdW5kZWZpbmVkIGJlaGF2aW9yIGluIHN5c2NhbGwgdXNpbmcsIGJlY2F1c2UgaG93IGRvIHdl
IGtub3cgd2hhdCBlcnJvciByZXR1cm4gaXMgdGhlIGV4cGVjdGVkPwo+Cj4+IEkganVzdCB3YW50
IHRvIGluY3JlYXNlIGNvdmVyYWdlIGFuZCBmaXggYWxsIHNpbWlsYXIgaXNzdWVzIGFzIHlvdSBk
aWQuIDotKQo+Pgo+PiBCZXN0IFJlZ2FyZHMsCj4+IFhpYW8gWWFuZwo+PiA+IFNpZ25lZC1vZmYt
Ynk6IEppbmh1aSBodWFuZyA8aHVhbmdqaC5qeUBjbi5mdWppdHN1LmNvbT4KPj4gPiAtLS0KPj4g
PiAgLi4uL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jICAgfCAz
MyArKysrKysrKysrKysrKystLS0tLS0tCj4+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkKPj4gPgo+PiA+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMv
a2VybmVsL3N5c2NhbGxzL2NvcHlfZmlsZV9yYW5nZS9jb3B5X2ZpbGVfcmFuZ2UwMi5jIGIvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlMDIu
Ywo+PiA+IGluZGV4IDA3YzAyMDcuLjllNjM1NmMgMTAwNjQ0Cj4+ID4gLS0tIGEvdGVzdGNhc2Vz
L2tlcm5lbC9zeXNjYWxscy9jb3B5X2ZpbGVfcmFuZ2UvY29weV9maWxlX3JhbmdlMDIuYwo+PiA+
ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY29weV9maWxlX3JhbmdlL2NvcHlfZmls
ZV9yYW5nZTAyLmMKPj4gPiBAQCAtNTQsMTkgKzU0LDMyIEBAIHN0YXRpYyB2b2lkIHZlcmlmeV9j
b3B5X2ZpbGVfcmFuZ2UodW5zaWduZWQgaW50IG4pCj4+ID4gICAgICAgVEVTVChzeXNfY29weV9m
aWxlX3JhbmdlKGZkX3NyYywgMCwgKnRjLT5jb3B5X3RvX2ZkLAo+PiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDAsIENPTlRTSVpFLCB0Yy0+ZmxhZ3MpKTsKPj4gPgo+PiA+IC0gICAg
IGlmIChUU1RfUkVUID09IC0xKSB7Cj4+ID4gLSAgICAgICAgICAgICBpZiAodGMtPmV4cF9lcnIg
PT0gVFNUX0VSUikgewo+PiA+ICsgICAgIGlmIChUU1RfUkVUICE9IC0xKSB7Cj4+ID4gKyAgICAg
ICAgICAgICB0c3RfcmVzKFRGQUlMLAo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAiY29weV9m
aWxlX3JhbmdlIHJldHVybmVkIHdyb25nIHZhbHVlOiAlbGQiLCBUU1RfUkVUKTsKPj4gPiArICAg
ICAgICAgICAgIHJldHVybjsKPj4gPiArICAgICB9Cj4+ID4gKwo+PiA+ICsgICAgIGlmICh0Yy0+
ZXhwX2VyciA9PSBUU1RfRVJSKSB7Cj4+ID4gKyAgICAgICAgICAgICB0c3RfcmVzKFRQQVNTIHwg
VFRFUlJOTywKPj4gPiArICAgICAgICAgICAgICAgICAgICAgImNvcHlfZmlsZV9yYW5nZSBmYWls
ZWQgYXMgZXhwZWN0ZWQiKTsKPj4gPiArICAgICB9IGVsc2Ugewo+PiA+ICsgICAgICAgICAgICAg
LyogY29weV9maWxlX3JhbmdlKCkgcmV0dXJuZWQgRUlTRElSIHdoZW4gY29weWVkIGNvbnRlbnRz
IHRvCj4+ID4gKyAgICAgICAgICAgICAgKiBkaXJlY3Rvcnkgb24gbmV3IGtlcm5lbHMsIGJ1dCBv
biBvbGQga2VybmVscywgaXQgcmV0dXJuZWQKPj4gPiArICAgICAgICAgICAgICAqIEVCQURGLgo+
PiA+ICsgICAgICAgICAgICAgICoKPj4gPiArICAgICAgICAgICAgICAqIHRoZSBwYXRjaCBhcyBm
b2xsd3M6Cj4+ID4gKyAgICAgICAgICAgICAgKiBjb21taXQgMTFjYmZiMTA3NzVhICgidmZzOiBk
ZW55IGNvcHlfZmlsZV9yYW5nZSgpIGZvciBub24gcmVndWxhciBmaWxlcyIpCj4+ID4gKyAgICAg
ICAgICAgICAgKi8KPj4gPiArICAgICAgICAgICAgIGlmICh0Yy0+ZXhwX2VyciA9PSBFSVNESVIg
JiYgVFNUX0VSUiA9PSBFQkFERikgewo+PiA+ICAgICAgICAgICAgICAgICAgICAgICB0c3RfcmVz
KFRQQVNTIHwgVFRFUlJOTywKPj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJjb3B5X2ZpbGVfcmFuZ2UgZmFpbGVkIGFzIGV4cGVjdGVkIik7Cj4+ID4gLSAgICAgICAg
ICAgICB9IGVsc2Ugewo+PiA+IC0gICAgICAgICAgICAgICAgICAgICB0c3RfcmVzKFRGQUlMIHwg
VFRFUlJOTywKPj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY29weV9maWxlX3Jh
bmdlIGZhaWxlZCB1bmV4cGVjdGVkbHk7IGV4cGVjdGVkICVzLCBidXQgZ290IiwKPj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB0c3Rfc3RyZXJybm8odGMtPmV4cF9lcnIpKTsKPj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY29weV9maWxlX3JhbmdlIGZhaWxlZCBh
cyBleHBlY3RlZCIpOwo+PiA+ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4+ID4gICAg
ICAgICAgICAgICB9Cj4+ID4gLSAgICAgfSBlbHNlIHsKPj4gPiAtICAgICAgICAgICAgIHRzdF9y
ZXMoVEZBSUwsCj4+ID4gLSAgICAgICAgICAgICAgICAgICAgICJjb3B5X2ZpbGVfcmFuZ2UgcmV0
dXJuZWQgd3JvbmcgdmFsdWU6ICVsZCIsIFRTVF9SRVQpOwo+PiA+ICsKPj4gPiArICAgICAgICAg
ICAgIHRzdF9yZXMoVEZBSUwgfCBUVEVSUk5PLAo+PiA+ICsgICAgICAgICAgICAgICAgICAgICAi
Y29weV9maWxlX3JhbmdlIGZhaWxlZCB1bmV4cGVjdGVkbHk7IGV4cGVjdGVkICVzLCBidXQgZ290
IiwKPj4gPiArICAgICAgICAgICAgICAgICAgICAgdHN0X3N0cmVycm5vKHRjLT5leHBfZXJyKSk7
Cj4+ID4gICAgICAgfQo+PiA+ICB9Cj4+ID4KPj4KPj4KPj4KPgo+Cj4gLS0KPiBSZWdhcmRzLAo+
IExpIFdhbmcKPgo+IC0tCj4gTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXgu
aXQvbGlzdGluZm8vbHRwCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==

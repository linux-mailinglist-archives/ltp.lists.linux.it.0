Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 403141F6A5
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 16:37:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0D71C294AC9
	for <lists+linux-ltp@lfdr.de>; Wed, 15 May 2019 16:37:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 238BB294AB2
 for <ltp@lists.linux.it>; Wed, 15 May 2019 16:37:53 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5F4EC1A00F68
 for <ltp@lists.linux.it>; Wed, 15 May 2019 16:37:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8C573AFCD;
 Wed, 15 May 2019 14:37:48 +0000 (UTC)
Date: Wed, 15 May 2019 16:37:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: xuyang <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190515143746.GA7507@dell5510>
References: <1557732392-7049-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190513131451.GA22761@dell5510> <5CDA5124.3070708@cn.fujitsu.com>
 <20190514120119.GA26452@dell5510> <5CDBD564.8010300@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CDBD564.8010300@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH] ltp-cap.m4: add libcap version detection && fix
 compiler error
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWWFuZywKCj4gPiA+IEF0IHRoZSBiZWdpbm5pbmcsIEkKPiA+ID4gICAgdGhpbmsgaXQgbWFr
ZXMgbm8gc2Vuc2UgYmVjYXVzZSBsaWJjYXAtMSBpcyB0b28gb2xkLiAgQnV0IEkgbm90aWNlcyB0
aGF0IGx0cC1xdW90YS5tNAo+ID4gPiAgICBoYXMgcXVvdGFfdjEgYW5kIHF1b3RhX3YyLiBJIGNo
YW5nZXMgbXkgbWluZC4KPiA+ID4gICAgU2luY2Ugd2UgaGF2ZSBkcm9wIGxpYm51bWEgdjEsIEkg
YWdyZWUgd2l0aCB5b3UgdGhhdCB3ZSBhbHNvIGRyb3AgbGliY2FwIHYxKHRvbyBvbGQpLgo+ID4g
PiAgICBBbHNvLCBJIHRoaW5rIHdlIHNob3VsZCBkcm9wIHF1b3RhX3YxIGJlY2F1c2UgaXQgaXMg
dG9vIG9sZCAoc2luY2UgTGludXggMi40LjIyLCBRX0dFVElORk8gaGFzCj4gPiA+ICAgIGJlZW4g
c3VwcG9ydGVkIGluIGtlcm5lbCkuCj4gPiBHb29kIHBvaW50LiBCdXQgSSdtIG5vdCBzdXJlIGlm
IGl0J3MgdGhlIHNhbWUsIGFzIFFGTVRfVkZTX09MRCBpcyBwYXJ0IG9mIGtlcm5lbAo+ID4gc291
cmNlIHRyZWUgKHBhcnQgb2Yga2VybmVsIHNwYWNlIGNvZGUpIHNvIGl0IG1ha2VzIHNlbnNlIHRv
IHRlc3QgaXQsIHdoZXJlYXMKPiA+IGxpYmNhcCB2MSBhbmQgbGlibnVtYSB2MSBhcmUganVzdCBv
bGQgdmVyc2lvbnMgb2YgdXNlciBzcGFjZSBsaWJyYXJ5Lgo+ID4gT3IgYW0gSSB3cm9uZz8KPiBI
aSBQZXRyCgo+ICAgIEkgaGF2ZSBzZWVuIGtlcm5lbCBzb3VyY2UgYWJvdXQgcXVvdGEgYW5kIHRy
eSBpdC4gSSB0aGluayB5b3UgYXJlIHJpZ2h0LiAgQnV0IGN1cnJlbnQgcXVvdGFfdjEKPiBhbmQg
cXVvdGFfdjIgZGV0ZWN0aW9uIGhhcyBwcm9ibGVtLiBJbiBrZXJuZWwgc291cmNlLCBJIGRpc2Fi
bGUgQ09ORklHX1FGTVRfVjIgYW5kIGVuYWJsZSBDT05GSUdfUUZNVF9WMQo+ICx0aGVuIEkgZm91
bmQgbHRwIHN0aWxsIGRldGVjdHMgcXVvdGF2MiBpbnN0ZWFkIG9mIHF1b3RhdjEsICBhbmQgcnVu
IC4vcXVvdGFjdGwwMSwgdGhlIGZvbGxvd2luZyBlcnJvciBvY2N1cnM6CkxUUCBkZXRlY3Rpb24g
aW4gbHRwLXF1b3RhLm00IGRlZmluZXMgX0xJTlVYX1FVT1RBX1ZFUlNJT04gZm9yIGRldGVjdGlv
bi4KSSBndWVzcyB5b3UnZCBoYXZlIHRvIGRlZmluZSBIQVZFX1FVT1RBVjEgYW5kIHVuZGVmaW5l
IEhBVkVfUVVPVEFWMiBpbiBpbgppbmNsdWRlL2NvbmZpZy5oLCBidXQgbm90IHRlc3RlZC4KCkJU
VyBfTElOVVhfUVVPVEFfVkVSU0lPTiB3YXMgcmVtb3ZlZCBmcm9tIGdsaWJjIGluIDIuMjUgWzFd
IFsyXSwgd2hpY2ggYmFzZWQgc2V0dXAKb24gPGxpbnV4L3F1b3RhLmg+LiBBbmQgbXVzbCBkZWZp
bmVzIG9ubHkgX0xJTlVYX1FVT1RBX1ZFUlNJT04gMi4KClJlZ2FyZHMgbWFuIGluZm8gdGhhdCB2
MSBpcyBmcm9tIGtlcm5lbCB2Mi40LjIyIHdlIHNob3VsZCBwcm9iYWJseSBhbHNvIHJlbW92ZQpp
dCdzIHN1cHBvcnQuCgpXZSBnb3QgYSBiaXQgYXdheSBmcm9tIGxpYmNhcCA6KS4KCktpbmQgcmVn
YXJkcywKUGV0cgoKWzFdIGh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPWdsaWJjLmdpdDth
PWNvbW1pdGRpZmY7aD00ZDcyODA4N2VmOGNjODI2YjA1YmQyMWQwYzc0ZDRlY2E5YjFhMjdkO2hw
PWRlNmI2ZDE0ZTliNGQ4ZTlhNzMzM2FkZGNhNTUxNjNkOWViYjdmZjYKWzJdIGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvNjY0MTU2LwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBo
dHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

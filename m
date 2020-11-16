Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 563B12B4502
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 14:52:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B9243C6490
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 14:52:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 05D713C27EC
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 14:52:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 482F41400DAD
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 14:52:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5B02AF17;
 Mon, 16 Nov 2020 13:52:39 +0000 (UTC)
References: <20191106061808.67330-1-lkml@jv-coder.de>
 <9478db1a-1005-1262-05e4-220bc74c0b02@jv-coder.de>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <9478db1a-1005-1262-05e4-220bc74c0b02@jv-coder.de>
Date: Mon, 16 Nov 2020 13:52:33 +0000
Message-ID: <87eektpfxa.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_subgroup_charge: Remove memory limitation
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8sCgpKb2VyZyBWZWhsb3cgPGxrbWxAanYtY29kZXIuZGU+IHdyaXRlczoKCj4gSGksCj4K
PiBhIGxpdHRsZSBwaW5nIGZvciB0aGlzIHBhdGNoPwo+IEkgcmVjZW50bHkgdXBkYXRlZCB0aGUg
bHRwIHN1aXRlIGZvciBvdXIgdGVzdHMgdG8gMjAyMDA5MzAgYW5kIHN0dW1ibGVkIAo+IG92ZXIg
dGhpcyBlcnJvciBhZ2Fpbi4KPiBBbnkgcmVhc29uIGZvciBub3QgYXBwbHlpbmcgaXQ/CgpJZiB0
aGVyZSB3YXMgbm8gcmVzcG9uc2UgaXQncyBzYWZlIHRvIGFzc3VtZSBpdCB3YXMgZm9yZ290dGVu
CmFib3V0LiBUaGFua3MgZm9yIGJ1bXBpbmcgaXQuCgo+Cj4gSsO2cmcKPgo+IE9uIDExLzYvMjAx
OSA3OjE4IEFNLCBKb2VyZyBWZWhsb3cgd3JvdGU6Cj4+IEZyb206IEpvZXJnIFZlaGxvdyA8am9l
cmcudmVobG93QGFveC10ZWNoLmRlPgo+Pgo+PiBUaGUgdGVzdCBpcyBzdXBwb3NlZCB0byB2ZXJp
ZnksIHRoYXQgbWVtb3J5IHVzZWQgYnkgYSB0YXNrCj4+IGlzIG5vdCBtaWdyYXRlZCB0byBhIHN1
Ymdyb3VwLCB3aGVuIHRoZSB0YXNrIGlzIG1pZ3JhdGVkLgo+PiBJbiBvcmRlciB0byB0ZXN0IHRo
aXMsIGl0IGlzIG5vdCByZXF1aXJlZCwgdG8gbGltaXQKPj4gdGhlIG1lbW9yeSBhdCBhbGwsIGJl
Y2F1c2UgYWNjb3VudGluZyBpcyBkb25lIGFueXdheSBhbmQKPj4gdGhlIHRlc3QgY2hlY2tzIHRo
ZSBtZW1vcnkgc3RhdGlzdGljcy4KPj4KPj4gVGhlcmVmb3JlIGFsbCBtZW1vcnkgbGltaXRpbmcg
aXMgcmVtb3ZlZC4gVGhpcyBhbHNvIGdldHMKPj4gcmlkIG9mIGEgZmF1bHR5IGFzc3VtcHRpb24g
d2hlbiB3cml0aW5nIHRoZSB0ZXN0Ogo+PiBUaGUgdGVzdCBhbGxvY2F0ZXMgMzMgcGFnZXMgdXNp
bmcgbW1hcC4gSXQgaXMgZXhwZWN0ZWQsCj4+IHRoYXQgaXQgZG9lcyBub3QgbmVlZCBtb3JlIHRo
YW4gMzMgKiBwYWdlc2l6ZSBvZiBtZW1vcnkuCj4+IEJ1dCBzb21ldGltZXMgdGhlIGtlcm5lbCBo
YXMgdG8gYWxsb2NhdGUgbmV3IHBhZ2UgdGFibGVzLgo+PiBUaGlzIGlzIGFjY291bnRlZCBhcyBr
bWVtIEFORCB1c2VyIG1lbW9yeS4KPj4gKFNlZSBrZXJuZWwgZG9jIGNncm91cC12MS9tZW1vcnku
dHh0IHNlY3Rpb24gMi43KQo+PiBJZiB0aGlzIGhhcHBlbmQsIHRoZSB0ZXN0IGZhaWxlZCwgaWYg
dGhlIHN5c3RlbSBoYXMgbm8gc3dhcCwKPj4gYmVjYXVzZSB0aGUgb29tIGtpbGxlciBraWxscyB0
aGUgcHJvY2Vzcy4KClBlcmhhcHMgdGhleSB3ZXJlIGNoZWNraW5nIGZvciBzaWRlIGVmZmVjdHMg
ZnJvbSBzZXR0aW5nIHRoZSBsaW1pdC4uLiBJCnRoaW5rIHRob3VnaCBpdCBpcyBjb3JyZWN0IHRv
IHJlbW92ZSB0aGVzZSBsaW1pdHMuCgpCb3RoIGNoZWNrX3N0YXQgbGluZXMgYXJlIHN1c3BlY3Qg
dG8gbWUgYXMgc29tZSB1bnJlbGF0ZWQgdGFza2xldCBjb3VsZApydW4gaW4gdGhlIHByb2Nlc3Nl
cyBjb250ZXh0IGFuZCBhbGxvY2F0ZSBzb21lIG1lbW9yeS4gUG9zc2libHkgdGhpcwpzaG91bGQg
YmUgY29udmVydGVkIHRvIG9ubHkgYW4gYXBwcm94aW1hdGUgY2hlY2s/Cgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBKb2VyZyBWZWhsb3cgPGpvZXJnLnZlaGxvd0Bhb3gtdGVjaC5kZT4KPj4gLS0tCj4+
ICAgLi4uL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX2xpYi5zaCB8
ICA0IC0tLS0KPj4gICAuLi4vbWVtY2cvZnVuY3Rpb25hbC9tZW1jZ19zdWJncm91cF9jaGFyZ2Uu
c2ggICAgICAgIHwgMTIgKy0tLS0tLS0tLS0tCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMTUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2Vy
bmVsL2NvbnRyb2xsZXJzL21lbWNnL2Z1bmN0aW9uYWwvbWVtY2dfbGliLnNoIGIvdGVzdGNhc2Vz
L2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX2xpYi5zaAo+PiBpbmRl
eCBhYWRhYWU0ZDIuLmFlYzhhMDBhYiAxMDA3NTUKPj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9j
b250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX2xpYi5zaAo+PiArKysgYi90ZXN0Y2Fz
ZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL2Z1bmN0aW9uYWwvbWVtY2dfbGliLnNoCj4+IEBA
IC00MDQsMTMgKzQwNCw5IEBAIHRlc3RfaHVnZXBhZ2UoKQo+PiAgIH0KPj4gICAKPj4gICAjIFRl
c3QgdGhlIG1lbW9yeSBjaGFyZ2Ugd29uJ3QgbW92ZSB0byBzdWJncm91cAo+PiAtIyAkMSAtIG1l
bW9yeS5saW1pdF9pbl9ieXRlcyBpbiBwYXJlbnQgZ3JvdXAKPj4gLSMgJDIgLSBtZW1vcnkubGlt
aXRfaW5fYnl0ZXMgaW4gc3ViIGdyb3VwCj4+ICAgdGVzdF9zdWJncm91cCgpCj4+ICAgewo+PiAg
IAlta2RpciBzdWJncm91cAo+PiAtCWVjaG8gJDEgPiBtZW1vcnkubGltaXRfaW5fYnl0ZXMKPj4g
LQllY2hvICQyID4gc3ViZ3JvdXAvbWVtb3J5LmxpbWl0X2luX2J5dGVzCj4+ICAgCj4+ICAgCXRz
dF9yZXNtIFRJTkZPICJSdW5uaW5nIG1lbWNnX3Byb2Nlc3MgLS1tbWFwLWFub24gLXMgJFBBR0VT
SVpFUyIKPj4gICAJbWVtY2dfcHJvY2VzcyAtLW1tYXAtYW5vbiAtcyAkUEFHRVNJWkVTICYKPj4g
ZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVtY2cvZnVuY3Rpb25h
bC9tZW1jZ19zdWJncm91cF9jaGFyZ2Uuc2ggYi90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJz
L21lbWNnL2Z1bmN0aW9uYWwvbWVtY2dfc3ViZ3JvdXBfY2hhcmdlLnNoCj4+IGluZGV4IDliMTFm
N2I1OC4uOThlNWFkNjhkIDEwMDc1NQo+PiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xs
ZXJzL21lbWNnL2Z1bmN0aW9uYWwvbWVtY2dfc3ViZ3JvdXBfY2hhcmdlLnNoCj4+ICsrKyBiL3Rl
c3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVtY2cvZnVuY3Rpb25hbC9tZW1jZ19zdWJncm91
cF9jaGFyZ2Uuc2gKPj4gQEAgLTI2LDcgKzI2LDcgQEAKPj4gICAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+PiAgIAo+PiAgIFRDSUQ9Im1lbWNnX3N1Ymdyb3VwX2NoYXJnZSIKPj4gLVRTVF9UT1RB
TD0zCj4+ICtUU1RfVE9UQUw9MQo+PiAgIAo+PiAgIC4gbWVtY2dfbGliLnNoCj4+ICAgCj4+IEBA
IC0zNiwxNSArMzYsNSBAQCB0ZXN0Y2FzZV8xKCkKPj4gICAJdGVzdF9zdWJncm91cCAkUEFHRVNJ
WkVTICQoKDIqUEFHRVNJWkVTKSkKPj4gICB9Cj4+ICAgCj4+IC10ZXN0Y2FzZV8yKCkKPj4gLXsK
Pj4gLQl0ZXN0X3N1Ymdyb3VwICRQQUdFU0laRVMgJFBBR0VTSVpFUwo+PiAtfQo+PiAtCj4+IC10
ZXN0Y2FzZV8zKCkKPj4gLXsKPj4gLQl0ZXN0X3N1Ymdyb3VwICRQQUdFU0laRVMgMAo+PiAtfQo+
PiAtCj4+ICAgcnVuX3Rlc3RzCj4+ICAgdHN0X2V4aXQKCgotLSAKVGhhbmsgeW91LApSaWNoYXJk
LgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZv
L2x0cAo=

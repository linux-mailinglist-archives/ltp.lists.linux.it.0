Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C03592B433D
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 13:00:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5C53E3C4F55
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 13:00:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 059DD3C2453
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 13:00:52 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7929760093A
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 13:00:52 +0100 (CET)
Received: from [192.168.178.40] (unknown [188.192.65.157])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 4C66DA07FD
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 12:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1605528051; bh=GIZj53b/I5MKDiJkamvIkKp+VzoJ4JL1eCZEM9B/D3M=;
 h=Subject:From:To:Message-ID:Date:MIME-Version;
 b=UQj66LKRCMULYaOpW5vkTAGHhOtEaVf9n+rBeK7ShChLdykb0dcOu4MvYeJAMROGF
 aoTdD4MykQiStbUWkGDjijrmC1bCmPW9lLy2cASQHpfys1pzXopbmbydevPlqo0GWL
 3CLB7+o4h024hp2iIRqy8cUmN30yj75+nr44GRt8=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
References: <20191106061808.67330-1-lkml@jv-coder.de>
Message-ID: <9478db1a-1005-1262-05e4-220bc74c0b02@jv-coder.de>
Date: Mon, 16 Nov 2020 13:00:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20191106061808.67330-1-lkml@jv-coder.de>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgphIGxpdHRsZSBwaW5nIGZvciB0aGlzIHBhdGNoPwpJIHJlY2VudGx5IHVwZGF0ZWQgdGhl
IGx0cCBzdWl0ZSBmb3Igb3VyIHRlc3RzIHRvIDIwMjAwOTMwIGFuZCBzdHVtYmxlZCAKb3ZlciB0
aGlzIGVycm9yIGFnYWluLgpBbnkgcmVhc29uIGZvciBub3QgYXBwbHlpbmcgaXQ/CgpKw7ZyZwoK
T24gMTEvNi8yMDE5IDc6MTggQU0sIEpvZXJnIFZlaGxvdyB3cm90ZToKPiBGcm9tOiBKb2VyZyBW
ZWhsb3cgPGpvZXJnLnZlaGxvd0Bhb3gtdGVjaC5kZT4KPgo+IFRoZSB0ZXN0IGlzIHN1cHBvc2Vk
IHRvIHZlcmlmeSwgdGhhdCBtZW1vcnkgdXNlZCBieSBhIHRhc2sKPiBpcyBub3QgbWlncmF0ZWQg
dG8gYSBzdWJncm91cCwgd2hlbiB0aGUgdGFzayBpcyBtaWdyYXRlZC4KPiBJbiBvcmRlciB0byB0
ZXN0IHRoaXMsIGl0IGlzIG5vdCByZXF1aXJlZCwgdG8gbGltaXQKPiB0aGUgbWVtb3J5IGF0IGFs
bCwgYmVjYXVzZSBhY2NvdW50aW5nIGlzIGRvbmUgYW55d2F5IGFuZAo+IHRoZSB0ZXN0IGNoZWNr
cyB0aGUgbWVtb3J5IHN0YXRpc3RpY3MuCj4KPiBUaGVyZWZvcmUgYWxsIG1lbW9yeSBsaW1pdGlu
ZyBpcyByZW1vdmVkLiBUaGlzIGFsc28gZ2V0cwo+IHJpZCBvZiBhIGZhdWx0eSBhc3N1bXB0aW9u
IHdoZW4gd3JpdGluZyB0aGUgdGVzdDoKPiBUaGUgdGVzdCBhbGxvY2F0ZXMgMzMgcGFnZXMgdXNp
bmcgbW1hcC4gSXQgaXMgZXhwZWN0ZWQsCj4gdGhhdCBpdCBkb2VzIG5vdCBuZWVkIG1vcmUgdGhh
biAzMyAqIHBhZ2VzaXplIG9mIG1lbW9yeS4KPiBCdXQgc29tZXRpbWVzIHRoZSBrZXJuZWwgaGFz
IHRvIGFsbG9jYXRlIG5ldyBwYWdlIHRhYmxlcy4KPiBUaGlzIGlzIGFjY291bnRlZCBhcyBrbWVt
IEFORCB1c2VyIG1lbW9yeS4KPiAoU2VlIGtlcm5lbCBkb2MgY2dyb3VwLXYxL21lbW9yeS50eHQg
c2VjdGlvbiAyLjcpCj4gSWYgdGhpcyBoYXBwZW5kLCB0aGUgdGVzdCBmYWlsZWQsIGlmIHRoZSBz
eXN0ZW0gaGFzIG5vIHN3YXAsCj4gYmVjYXVzZSB0aGUgb29tIGtpbGxlciBraWxscyB0aGUgcHJv
Y2Vzcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEpvZXJnIFZlaGxvdyA8am9lcmcudmVobG93QGFveC10
ZWNoLmRlPgo+IC0tLQo+ICAgLi4uL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFs
L21lbWNnX2xpYi5zaCB8ICA0IC0tLS0KPiAgIC4uLi9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX3N1
Ymdyb3VwX2NoYXJnZS5zaCAgICAgICAgfCAxMiArLS0tLS0tLS0tLS0KPiAgIDIgZmlsZXMgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDE1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rl
c3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVtY2cvZnVuY3Rpb25hbC9tZW1jZ19saWIuc2gg
Yi90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL2Z1bmN0aW9uYWwvbWVtY2dfbGli
LnNoCj4gaW5kZXggYWFkYWFlNGQyLi5hZWM4YTAwYWIgMTAwNzU1Cj4gLS0tIGEvdGVzdGNhc2Vz
L2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX2xpYi5zaAo+ICsrKyBi
L3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVtY2cvZnVuY3Rpb25hbC9tZW1jZ19saWIu
c2gKPiBAQCAtNDA0LDEzICs0MDQsOSBAQCB0ZXN0X2h1Z2VwYWdlKCkKPiAgIH0KPiAgIAo+ICAg
IyBUZXN0IHRoZSBtZW1vcnkgY2hhcmdlIHdvbid0IG1vdmUgdG8gc3ViZ3JvdXAKPiAtIyAkMSAt
IG1lbW9yeS5saW1pdF9pbl9ieXRlcyBpbiBwYXJlbnQgZ3JvdXAKPiAtIyAkMiAtIG1lbW9yeS5s
aW1pdF9pbl9ieXRlcyBpbiBzdWIgZ3JvdXAKPiAgIHRlc3Rfc3ViZ3JvdXAoKQo+ICAgewo+ICAg
CW1rZGlyIHN1Ymdyb3VwCj4gLQllY2hvICQxID4gbWVtb3J5LmxpbWl0X2luX2J5dGVzCj4gLQll
Y2hvICQyID4gc3ViZ3JvdXAvbWVtb3J5LmxpbWl0X2luX2J5dGVzCj4gICAKPiAgIAl0c3RfcmVz
bSBUSU5GTyAiUnVubmluZyBtZW1jZ19wcm9jZXNzIC0tbW1hcC1hbm9uIC1zICRQQUdFU0laRVMi
Cj4gICAJbWVtY2dfcHJvY2VzcyAtLW1tYXAtYW5vbiAtcyAkUEFHRVNJWkVTICYKPiBkaWZmIC0t
Z2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNn
X3N1Ymdyb3VwX2NoYXJnZS5zaCBiL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVtY2cv
ZnVuY3Rpb25hbC9tZW1jZ19zdWJncm91cF9jaGFyZ2Uuc2gKPiBpbmRleCA5YjExZjdiNTguLjk4
ZTVhZDY4ZCAxMDA3NTUKPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNn
L2Z1bmN0aW9uYWwvbWVtY2dfc3ViZ3JvdXBfY2hhcmdlLnNoCj4gKysrIGIvdGVzdGNhc2VzL2tl
cm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX3N1Ymdyb3VwX2NoYXJnZS5z
aAo+IEBAIC0yNiw3ICsyNiw3IEBACj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4g
ICBUQ0lEPSJtZW1jZ19zdWJncm91cF9jaGFyZ2UiCj4gLVRTVF9UT1RBTD0zCj4gK1RTVF9UT1RB
TD0xCj4gICAKPiAgIC4gbWVtY2dfbGliLnNoCj4gICAKPiBAQCAtMzYsMTUgKzM2LDUgQEAgdGVz
dGNhc2VfMSgpCj4gICAJdGVzdF9zdWJncm91cCAkUEFHRVNJWkVTICQoKDIqUEFHRVNJWkVTKSkK
PiAgIH0KPiAgIAo+IC10ZXN0Y2FzZV8yKCkKPiAtewo+IC0JdGVzdF9zdWJncm91cCAkUEFHRVNJ
WkVTICRQQUdFU0laRVMKPiAtfQo+IC0KPiAtdGVzdGNhc2VfMygpCj4gLXsKPiAtCXRlc3Rfc3Vi
Z3JvdXAgJFBBR0VTSVpFUyAwCj4gLX0KPiAtCj4gICBydW5fdGVzdHMKPiAgIHRzdF9leGl0CgoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=

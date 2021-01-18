Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7652FA93F
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 19:51:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E54F3C5FA8
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Jan 2021 19:51:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E15EC3C2329
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 19:50:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AB9321A00357
 for <ltp@lists.linux.it>; Mon, 18 Jan 2021 19:50:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8CDFAE6E;
 Mon, 18 Jan 2021 18:50:57 +0000 (UTC)
References: <20210118155628.9248-1-rpalethorpe@suse.com>
 <AM0PR05MB4642C547F8E6A3D5C230B87DECA40@AM0PR05MB4642.eurprd05.prod.outlook.com>
User-agent: mu4e 1.4.14; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: "Hartkopp, Oliver, Dr. (EESC/5)" <oliver.hartkopp@volkswagen.de>
In-reply-to: <AM0PR05MB4642C547F8E6A3D5C230B87DECA40@AM0PR05MB4642.eurprd05.prod.outlook.com>
Date: Mon, 18 Jan 2021 18:50:57 +0000
Message-ID: <87h7neoz8u.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/5] Convert CAN tests to new LTP API
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gT2xpdmVyLAoKSGFydGtvcHAsIE9saXZlciwgRHIuIChFRVNDLzUpIDxvbGl2ZXIuaGFy
dGtvcHBAdm9sa3N3YWdlbi5kZT4gd3JpdGVzOgoKPiBEZWFyIFJpY2hhcmQsCj4KPiBlaXRoZXIg
SSdtIG5vdCB1c2luZyBteSBWVy1FbWFpbCBmb3IgT1NTL1NvY2tldENBTiBhbnltb3JlIGFuZCB0
aGUKPiBzb2NrZXRjYW4tdXNlcnNAYmVybGlvcyBpcyBhbHNvIG5vdCB1c2VkIGFueW1vcmUuCgpU
aGFua3MsIEkgd2lsbCBzZW5kIGEgVjIgd2l0aCB0aGVzZSBhZGRyZXNzZXMgcmVtb3ZlZCBmcm9t
IG91ciBkb2NzLgoKPgo+IFBsZWFzZSByZXNlbmQgeW91IHBhdGNoIHNldCB3aXRoIHRoZXNlIHVw
ZGF0ZWQgbWFpbCBhZGRyZXNzZXM6Cj4KPiBPbGl2ZXIgSGFydGtvcHAgPHNvY2tldGNhbkBoYXJ0
a29wcC5uZXQ+Cj4gTGludXgtQ0FOIE1MIDxsaW51eC1jYW5Admdlci5rZXJuZWwub3JnPgo+Cj4g
TWFueSB0aGFua3MsCj4gT2xpdmVyCj4KPiAtLS0tLVVyc3Byw7xuZ2xpY2hlIE5hY2hyaWNodC0t
LS0tCj4gVm9uOiBSaWNoYXJkIFBhbGV0aG9ycGUgPHJwYWxldGhvcnBlQHN1c2UuY29tPiAKPiBH
ZXNlbmRldDogTW9udGFnLCAxOC4gSmFudWFyIDIwMjEgMTY6NTYKPiBBbjogbHRwQGxpc3RzLmxp
bnV4Lml0Cj4gQ2M6IHNvY2tldGNhbi11c2Vyc0BsaXN0cy5iZXJsaW9zLmRlOyBIYXJ0a29wcCwg
T2xpdmVyLCBEci4gKEVFU0MvNSkgPG9saXZlci5oYXJ0a29wcEB2b2xrc3dhZ2VuLmRlPjsgUmlj
aGFyZCBQYWxldGhvcnBlIDxycGFsZXRob3JwZUBzdXNlLmNvbT4KPiBCZXRyZWZmOiBbUEFUQ0gg
MC81XSBDb252ZXJ0IENBTiB0ZXN0cyB0byBuZXcgTFRQIEFQSQo+Cj4gSGVsbG8sCj4KPiBUaGlz
IGlzIGFuIGF0dGVtcHQgdG8gY29udmVydCB0aGUgQ0FOIHRlc3RzIHRvIHRoZSAobW9kZXJuKSBM
VFAgQVBJIGFuZCByZW1vdmVzIHRoZSB3cmFwcGVyIHNjcmlwdC4gSSBoYXZlIHRyaWVkIHRvIGtl
ZXAgdGhlIGNvcmUgdGVzdCBiZWhhdmlvdXIgdGhlIHNhbWUsIGJ1dCAoZm9yIGV4YW1wbGUpIG1v
dmluZyB0byB0aGUgU0FGRV8gZnVuY3Rpb25zIHdpbGwgbmF0dXJhbGx5IGludHJvZHVjZSBzb21l
IGNoYW5nZXMgaW4gZXJyb3IgY2hlY2tpbmcuIERlbGliZXJhdGUgYmVoYXZpb3JhbCBjaGFuZ2Vz
IGhhdmUgYmVlbiBub3RlZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2VzLgo+Cj4gUmljaGFyZCBQYWxl
dGhvcnBlICg1KToKPiAgIEFQSTogQWRkIEZJTEVfU0NBTkYgdG8gbmV3IGxpYgo+ICAgY2FuOiBB
ZGQgY2FuX2NvbW1vbi5oIGZvciB2Y2FuIGRldmljZSBzZXR1cAo+ICAgY2FuX2ZpbHRlcjogQ29u
dmVydCB0byBuZXcgbGlicmFyeQo+ICAgY2FuX3JlY3Zfb3duX21zZ3M6IENvbnZlcnQgdG8gbmV3
IGxpYnJhcnkKPiAgIGNhbjogUmVtb3ZlIG9ic29sZXRlIHRlc3Qgd3JhcHBlciBzY3JpcHQKPgo+
ICBpbmNsdWRlL3RzdF9zYWZlX2ZpbGVfb3BzLmggICAgICAgICAgICAgICAgICAgfCAgIDMgKwo+
ICB0ZXN0Y2FzZXMvbmV0d29yay9jYW4vTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgIDIgLQo+
ICAuLi4vY2FuL2ZpbHRlci10ZXN0cy8wMF9EZXNjcmlwdGlvbnMudHh0ICAgICAgfCAgIDEgKwo+
ICB0ZXN0Y2FzZXMvbmV0d29yay9jYW4vZmlsdGVyLXRlc3RzL0lOU1RBTEwgICAgfCAgIDMgKy0K
PiAgdGVzdGNhc2VzL25ldHdvcmsvY2FuL2ZpbHRlci10ZXN0cy9NYWtlZmlsZSAgIHwgICAyIC0K
PiAgLi4uL25ldHdvcmsvY2FuL2ZpbHRlci10ZXN0cy9jYW5fY29tbW9uLmggICAgIHwgIDcwICsr
KysKPiAgLi4uL25ldHdvcmsvY2FuL2ZpbHRlci10ZXN0cy9jYW5fZmlsdGVyLmMgICAgIHwgMzE3
ICsrKysrKystLS0tLS0tLS0tLQo+ICAuLi4vY2FuL2ZpbHRlci10ZXN0cy9jYW5fcmN2X293bl9t
c2dzLmMgICAgICAgfCAyNzMgKysrKystLS0tLS0tLS0tCj4gIC4uLi9uZXR3b3JrL2Nhbi9maWx0
ZXItdGVzdHMvY2FuX3J1bl90ZXN0cy5zaCB8IDEwNiAtLS0tLS0KPiAgOSBmaWxlcyBjaGFuZ2Vk
LCAyODggaW5zZXJ0aW9ucygrKSwgNDg5IGRlbGV0aW9ucygtKSAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHRlc3RjYXNlcy9uZXR3b3JrL2Nhbi9maWx0ZXItdGVzdHMvY2FuX2NvbW1vbi5oCj4gIGRlbGV0
ZSBtb2RlIDEwMDc1NSB0ZXN0Y2FzZXMvbmV0d29yay9jYW4vZmlsdGVyLXRlc3RzL2Nhbl9ydW5f
dGVzdHMuc2gKCgotLSAKVGhhbmsgeW91LApSaWNoYXJkLgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

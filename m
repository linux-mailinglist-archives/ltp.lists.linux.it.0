Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EB23E9FE5
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 09:53:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D67533C6D5E
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 09:53:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 27E243C32BD
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 09:53:12 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 115FF1000DE7
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 09:53:11 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 80040221C7;
 Thu, 12 Aug 2021 07:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628754791;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jHFbhRbDcY3k9BrruWBbwbFzTmZbBwLVqVvyozAZw1o=;
 b=g5effdflXX7HzAMW7SnmDySQvmHTD+AZ3nWFXZiYiMsrP334/wQMDRydqmn+pCy/MzbFfB
 GLSZAWpOIU+L+IZN8qTowLJX026gn8pMe1Gx+zgmC+3PKlDzqkbV6l7fxQrTrBmLe6tw2l
 gUFNqRwZUV2czzn1cjmI9MozzTVO/nE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628754791;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jHFbhRbDcY3k9BrruWBbwbFzTmZbBwLVqVvyozAZw1o=;
 b=w7Wg1IhkcgkU7QhDtrVbPtDLgcpr6n1RYpuff3vG3LkXcoSxk1uRfEeD85c8n0mnFm6BL3
 rRDbJn7fT07SGFDQ==
Received: from g78 (rpalethorpe.udp.ovpn1.nue.suse.de [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 40F43A3E46;
 Thu, 12 Aug 2021 07:53:11 +0000 (UTC)
References: <20210811101058.36695-1-krzysztof.kozlowski@canonical.com>
 <20210811101058.36695-2-krzysztof.kozlowski@canonical.com>
 <87v94ckpow.fsf@suse.de>
 <90ff7e98-eea9-fe31-15ea-6bb1f12b4eb8@canonical.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-reply-to: <90ff7e98-eea9-fe31-15ea-6bb1f12b4eb8@canonical.com>
Date: Thu, 12 Aug 2021 08:53:08 +0100
Message-ID: <87czqjm74r.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RESEND PATCH 1/4] controllers/memcg: account per-node
 kernel memory
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

SGVsbG8sCgpLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNh
bC5jb20+IHdyaXRlczoKCj4gT24gMTEvMDgvMjAyMSAxNjo0MiwgUmljaGFyZCBQYWxldGhvcnBl
IHdyb3RlOgo+PiBIZWxsbyBLcnp5c3p0b2YsCj4+IAo+PiBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+IHdyaXRlczoKPj4gCj4+PiBSZWNlbnQg
TGludXgga2VybmVscyAoKSBjaGFyZ2UgZ3JvdXBzIGFsc28gd2l0aCBrZXJuZWwgbWVtb3J5LiAg
VGhpcyBpcwo+Pj4gbm90IGxpbWl0ZWQgb25seSB0byBwcm9jZXNzLWFsbG9jYXRlZCBtZW1vcnkg
YnV0IGFsc28gY2dyb3VwLWhhbmRsaW5nCj4+PiBjb2RlIG1lbW9yeSBhcyB3ZWxsLgo+Pj4KPj4+
IEZvciBleGFtcGxlIHNpbmNlIGtlcm5lbCB2NS45IHdpdGggY29tbWl0IDNlMzhlMGFhY2E5ZSAo
Im1tOiBtZW1jZzoKPj4+IGNoYXJnZSBtZW1jZyBwZXJjcHUgbWVtb3J5IHRvIHRoZSBwYXJlbnQg
Y2dyb3VwIikgY3JlYXRpbmcgYSBzdWJncm91cAo+Pj4gY2F1c2VzIHNldmVyYWwga2VybmVsIGFs
bG9jYXRpb25zIHRvd2FyZHMgdGhpcyBncm91cC4KPj4+Cj4+PiBUaGVzZSBhZGRpdGlvbmFsIGtl
cm5lbCBtZW1vcnkgYWxsb2NhdGlvbnMgYXJlIHByb3BvcnRpb25hbCB0byBudW1iZXIgb2YKPj4+
IENQVXMgYW5kIG51bWJlciBvZiBub2Rlcy4KPj4+Cj4+PiBPbiBjNC44eGxhcmdlIEFXUyBpbnN0
YW5jZSB3aXRoIDM2IGNvcmVzIGluIHR3byBub2RlcyB3aXRoIHY1LjExIExpbnV4Cj4+PiBrZXJu
ZWwgdGhlIG1lbWNnX3N1Ymdyb3VwX2NoYXJnZSBhbmQgbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0
IHRlc3RzIHdlcmUKPj4+IGZhaWxpbmc6Cj4+Pgo+Pj4gICAgIG1lbWNnX3VzZV9oaWVyYXJjaHlf
dGVzdCAxIFRJTkZPOiB0aW1lb3V0IHBlciBydW4gaXMgMGggNW0gMHMKPj4+ICAgICBtZW1jZ191
c2VfaGllcmFyY2h5X3Rlc3QgMSBUSU5GTzogc2V0IC9kZXYvbWVtY2cvbWVtb3J5LnVzZV9oaWVy
YXJjaHkgdG8gMCBmYWlsZWQKPj4+ICAgICBtZW1jZ191c2VfaGllcmFyY2h5X3Rlc3QgMSBUSU5G
TzogdGVzdCBpZiBvbmUgb2YgdGhlIGFuY2VzdG9ycyBnb2VzIG92ZXIgaXRzIGxpbWl0LCB0aGUg
cHJvY2VzIHdpbGwgYmUga2lsbGVkCj4+PiAgICAgbWtkaXI6IGNhbm5vdCBjcmVhdGUgZGlyZWN0
b3J5IOKAmHN1Ymdyb3Vw4oCZOiBDYW5ub3QgYWxsb2NhdGUgbWVtb3J5Cj4+PiAgICAgL2hvbWUv
dWJ1bnR1L2x0cC1pbnN0YWxsL3Rlc3RjYXNlcy9iaW4vbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0
LnNoOiAyNjogY2Q6IGNhbid0IGNkIHRvIHN1Ymdyb3VwCj4+PiAgICAgbWVtY2dfdXNlX2hpZXJh
cmNoeV90ZXN0IDEgVElORk86IFJ1bm5pbmcgbWVtY2dfcHJvY2VzcyAtLW1tYXAtbG9jazEgLXMg
ODE5Mgo+Pj4gICAgIG1lbWNnX3VzZV9oaWVyYXJjaHlfdGVzdCAxIFRGQUlMOiBwcm9jZXNzICBp
cyBub3Qga2lsbGVkCj4+PiAgICAgcm1kaXI6IGZhaWxlZCB0byByZW1vdmUgJ3N1Ymdyb3VwJzog
Tm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+Pj4KPj4+IFRoZSBrZXJuZWwgd2FzIHVuYWJsZSB0
byBjcmVhdGUgdGhlIHN1Ymdyb3VwIChta2RpciByZXR1cm5lZCAtRU5PTUVNKQo+Pj4gZHVlIHRv
IHRoaXMgYWRkaXRpb25hbCBwZXItbm9kZSBrZXJuZWwgbWVtb3J5IGFsbG9jYXRpb25zLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAY2Fub25pY2FsLmNvbT4KPj4+IC0tLQo+Pj4gIC4uLi9jb250cm9sbGVycy9tZW1jZy9mdW5j
dGlvbmFsL21lbWNnX2xpYi5zaCB8IDQ0ICsrKysrKysrKysrKysrKysrKysKPj4+ICAuLi4vbWVt
Y2cvZnVuY3Rpb25hbC9tZW1jZ19zdWJncm91cF9jaGFyZ2Uuc2ggfCAgOCArLS0tCj4+PiAgLi4u
L2Z1bmN0aW9uYWwvbWVtY2dfdXNlX2hpZXJhcmNoeV90ZXN0LnNoICAgIHwgIDggKysrLQo+Pj4g
IDMgZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlv
bmFsL21lbWNnX2xpYi5zaCBiL3Rlc3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVtY2cvZnVu
Y3Rpb25hbC9tZW1jZ19saWIuc2gKPj4+IGluZGV4IGRhZDY2Yzc5OGUxOS4uNzAwZTllMzY3YmZm
IDEwMDc1NQo+Pj4gLS0tIGEvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5j
dGlvbmFsL21lbWNnX2xpYi5zaAo+Pj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVy
cy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX2xpYi5zaAo+Pj4gQEAgLTYzLDYgKzYzLDUwIEBAIG1l
bWNnX3JlcXVpcmVfaGllcmFyY2h5X2Rpc2FibGVkKCkKPj4+ICAJZmkKPj4+ICB9Cj4+PiAgCj4+
PiArIyBLZXJuZWwgbWVtb3J5IGFsbG9jYXRlZCBmb3IgdGhlIHByb2Nlc3MgaXMgYWxzbyBjaGFy
Z2VkLiAgSXQgbWlnaHQgZGVwZW5kIG9uCj4+PiArIyB0aGUgbnVtYmVyIG9mIENQVXMgYW5kIG51
bWJlciBvZiBub2Rlcy4gRm9yIGV4YW1wbGUgb24ga2VybmVsIHY1LjExCj4+PiArIyBhZGRpdGlv
bmFsbHkgdG90YWxfY3B1cyAocGx1cyAxIG9yIDIpIHBhZ2VzIGFyZSBjaGFyZ2VkIHRvIHRoZSBn
cm91cCB2aWEKPj4+ICsjIGtlcm5lbCBtZW1vcnkuICBGb3IgYSB0d28tbm9kZSBtYWNoaW5lLCBh
ZGRpdGlvbmFsIDEwOCBwYWdlcyBrZXJuZWwgbWVtb3J5Cj4+PiArIyBhcmUgY2hhcmdlZCB0byB0
aGUgZ3JvdXAuCj4+PiArIwo+Pj4gKyMgQWRqdXN0IHRoZSBsaW1pdCB0byBhY2NvdW50IHN1Y2gg
cGVyLUNQVSBhbmQgcGVyLW5vZGUga2VybmVsIG1lbW9yeS4KPj4+ICsjICQxIC0gdmFyaWFibGUg
bmFtZSB3aXRoIGxpbWl0IHRvIGFkanVzdAo+Pj4gK21lbWNnX2FkanVzdF9saW1pdF9mb3Jfa21l
bSgpCj4+PiArewo+Pj4gKwlbICQjIC1uZSAxIF0gJiYgdHN0X2JyayBUQlJPSyAibWVtY2dfYWRq
dXN0X2xpbWl0X2Zvcl9rbWVtIGV4cGVjdHMgMSBwYXJhbWV0ZXIiCj4+PiArCWV2YWwgImxvY2Fs
IF9saW1pdD1cJCQxIgo+PiAKPj4gQ291bGQgd2UgZG8gdGhpcyBhIHNpbXBsZXIgd2F5Pwo+PiAK
Pj4gSXQgd291bGQgYmUgbXVjaCBlYXNpZXIgdG8gcmVhZCBpZiB3ZSBqdXN0IHJldHVybmVkIHRo
ZSB2YWx1ZSB3aGljaAo+PiBuZWVkZWQgdG8gYmUgYWRkZWQuCj4KPiBTdXJlLCBJIGNhbiBjaGFu
Z2UgaXQuIEp1c3Qgbm90ZSB0aGF0IHRoZSBjYWxsZXIvdXNlciB3aWxsIHJlcXVpcmUKPiBzbGln
aHRseSBtb3JlIGNvZGUuCgpUaGFua3MsIHllcy4gSSB0aGluayBhIHZlcnkgbGFyZ2UgY29kZSBz
YXZpbmcgd291bGQgYmUgcmVxdWlyZWQgdG8KanVzdGlmeSB1c2luZyBldmFsIGluIHRoaXMgd2F5
LgoKLS0gClRoYW5rIHlvdSwKUmljaGFyZC4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

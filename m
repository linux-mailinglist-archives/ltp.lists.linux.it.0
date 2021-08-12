Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E64E3E9FF7
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 09:56:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4C1C83C6BC1
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Aug 2021 09:55:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B786A3C5A51
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 09:55:55 +0200 (CEST)
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 76D4160065D
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 09:55:54 +0200 (CEST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 626AC4066B
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 07:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1628754953;
 bh=OqUThz7g7puu9XnyoM3E1TgYpHS1gJc/JYyjJsUrRHI=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=gtrPeHgPp2T5wsC7gIxY5oGL+1lRvjIEtV31dKeZT8rSNK1hwfjowGBuQiWtwvgll
 1KlQK+wqfTqlksKagvEU7tig6iITBq4h/plWD7xsExnVyqYJz5GiR2wXx4icLidFrS
 1f4a6zRJTRfrTE1AAB9eoxoqSUtmpZrFBmPF/HNkde8Ygy461jcmw1mfE0sqNL75Pq
 Trq9mw8/axDf2Q2xQlosVwUm/GfW1Dr7MJq27L5Ph1pinu3aXSEV386WO1Lnoz/Zlo
 kmAHnEdM5EBRUmM694JnCRCte5vKlSZLTQeYX/0bI2Y7y+w+D7asvwUNEkUDJtEUXa
 GmxQf+T3Ij7mw==
Received: by mail-ed1-f72.google.com with SMTP id
 j15-20020aa7c40f0000b02903be5fbe68a9so2660868edq.2
 for <ltp@lists.linux.it>; Thu, 12 Aug 2021 00:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OqUThz7g7puu9XnyoM3E1TgYpHS1gJc/JYyjJsUrRHI=;
 b=mXvDrDAbfIPkFOyVUvrDuxHjGBdZVO1HLn4D5R87W6vZoTEEJgSFPC7gfw0kJ4r5Tf
 RzeQO/dMRWNshK61HuKCdAYtxjwrM6D1Q7MOvkWrGmzjw7FazEiJFL/XDgwd42uTmdXr
 ev2QvX3R8rfmgfFBGLB7rARNm5F6loeCcBKq/5MlFjx1J42OQ1DRZMEBROnpCuptTzKk
 FavF6z3S2g5oABJs7GD4SvKVUI5GdSnax69VRAr4cJAKVJvDjzLjvlP0L0krhBgA5wEA
 FnVt3In82pV7DrQxEA2yxa4rvQbe6TR9QEIXgFgTS/QfjgECJVzGbeS3TlQdvsIWu0lt
 KdBg==
X-Gm-Message-State: AOAM5311RMCcDhALu4AcNVrfYXyl+QCJhTyeQBXtVpZxzF9tq6cpp29z
 iTgUN0PFs3m4gUhnCrM8P9J5it41OShWugQeRDNJSsCN+YWl0ozPFtnVQ6TVRri102jj7voWuPT
 k6TLfdLXs7Twb0b+HtF8XZsRf8fBg
X-Received: by 2002:a17:906:5a98:: with SMTP id
 l24mr2360453ejq.540.1628754952756; 
 Thu, 12 Aug 2021 00:55:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNmiHEH1wysXWTFfqB/hUO66xvOY1GYHg5PPbS8xq9Jm++Ukvo0gZXfu0+8G/7ykqZVy+aCA==
X-Received: by 2002:a17:906:5a98:: with SMTP id
 l24mr2360443ejq.540.1628754952570; 
 Thu, 12 Aug 2021 00:55:52 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
 by smtp.gmail.com with ESMTPSA id y1sm510535ejf.2.2021.08.12.00.55.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 00:55:52 -0700 (PDT)
To: rpalethorpe@suse.de
References: <20210811101058.36695-1-krzysztof.kozlowski@canonical.com>
 <20210811101058.36695-2-krzysztof.kozlowski@canonical.com>
 <87v94ckpow.fsf@suse.de> <90ff7e98-eea9-fe31-15ea-6bb1f12b4eb8@canonical.com>
 <87czqjm74r.fsf@suse.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f02d39b6-2c4a-f8d8-520d-50b8cf1ad0c9@canonical.com>
Date: Thu, 12 Aug 2021 09:55:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87czqjm74r.fsf@suse.de>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gMTIvMDgvMjAyMSAwOTo1MywgUmljaGFyZCBQYWxldGhvcnBlIHdyb3RlOgo+IEhlbGxvLAo+
IAo+IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAY2Fub25pY2FsLmNv
bT4gd3JpdGVzOgo+IAo+PiBPbiAxMS8wOC8yMDIxIDE2OjQyLCBSaWNoYXJkIFBhbGV0aG9ycGUg
d3JvdGU6Cj4+PiBIZWxsbyBLcnp5c3p0b2YsCj4+Pgo+Pj4gS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPiB3cml0ZXM6Cj4+Pgo+Pj4+IFJlY2Vu
dCBMaW51eCBrZXJuZWxzICgpIGNoYXJnZSBncm91cHMgYWxzbyB3aXRoIGtlcm5lbCBtZW1vcnku
ICBUaGlzIGlzCj4+Pj4gbm90IGxpbWl0ZWQgb25seSB0byBwcm9jZXNzLWFsbG9jYXRlZCBtZW1v
cnkgYnV0IGFsc28gY2dyb3VwLWhhbmRsaW5nCj4+Pj4gY29kZSBtZW1vcnkgYXMgd2VsbC4KPj4+
Pgo+Pj4+IEZvciBleGFtcGxlIHNpbmNlIGtlcm5lbCB2NS45IHdpdGggY29tbWl0IDNlMzhlMGFh
Y2E5ZSAoIm1tOiBtZW1jZzoKPj4+PiBjaGFyZ2UgbWVtY2cgcGVyY3B1IG1lbW9yeSB0byB0aGUg
cGFyZW50IGNncm91cCIpIGNyZWF0aW5nIGEgc3ViZ3JvdXAKPj4+PiBjYXVzZXMgc2V2ZXJhbCBr
ZXJuZWwgYWxsb2NhdGlvbnMgdG93YXJkcyB0aGlzIGdyb3VwLgo+Pj4+Cj4+Pj4gVGhlc2UgYWRk
aXRpb25hbCBrZXJuZWwgbWVtb3J5IGFsbG9jYXRpb25zIGFyZSBwcm9wb3J0aW9uYWwgdG8gbnVt
YmVyIG9mCj4+Pj4gQ1BVcyBhbmQgbnVtYmVyIG9mIG5vZGVzLgo+Pj4+Cj4+Pj4gT24gYzQuOHhs
YXJnZSBBV1MgaW5zdGFuY2Ugd2l0aCAzNiBjb3JlcyBpbiB0d28gbm9kZXMgd2l0aCB2NS4xMSBM
aW51eAo+Pj4+IGtlcm5lbCB0aGUgbWVtY2dfc3ViZ3JvdXBfY2hhcmdlIGFuZCBtZW1jZ191c2Vf
aGllcmFyY2h5X3Rlc3QgdGVzdHMgd2VyZQo+Pj4+IGZhaWxpbmc6Cj4+Pj4KPj4+PiAgICAgbWVt
Y2dfdXNlX2hpZXJhcmNoeV90ZXN0IDEgVElORk86IHRpbWVvdXQgcGVyIHJ1biBpcyAwaCA1bSAw
cwo+Pj4+ICAgICBtZW1jZ191c2VfaGllcmFyY2h5X3Rlc3QgMSBUSU5GTzogc2V0IC9kZXYvbWVt
Y2cvbWVtb3J5LnVzZV9oaWVyYXJjaHkgdG8gMCBmYWlsZWQKPj4+PiAgICAgbWVtY2dfdXNlX2hp
ZXJhcmNoeV90ZXN0IDEgVElORk86IHRlc3QgaWYgb25lIG9mIHRoZSBhbmNlc3RvcnMgZ29lcyBv
dmVyIGl0cyBsaW1pdCwgdGhlIHByb2NlcyB3aWxsIGJlIGtpbGxlZAo+Pj4+ICAgICBta2Rpcjog
Y2Fubm90IGNyZWF0ZSBkaXJlY3Rvcnkg4oCYc3ViZ3JvdXDigJk6IENhbm5vdCBhbGxvY2F0ZSBt
ZW1vcnkKPj4+PiAgICAgL2hvbWUvdWJ1bnR1L2x0cC1pbnN0YWxsL3Rlc3RjYXNlcy9iaW4vbWVt
Y2dfdXNlX2hpZXJhcmNoeV90ZXN0LnNoOiAyNjogY2Q6IGNhbid0IGNkIHRvIHN1Ymdyb3VwCj4+
Pj4gICAgIG1lbWNnX3VzZV9oaWVyYXJjaHlfdGVzdCAxIFRJTkZPOiBSdW5uaW5nIG1lbWNnX3By
b2Nlc3MgLS1tbWFwLWxvY2sxIC1zIDgxOTIKPj4+PiAgICAgbWVtY2dfdXNlX2hpZXJhcmNoeV90
ZXN0IDEgVEZBSUw6IHByb2Nlc3MgIGlzIG5vdCBraWxsZWQKPj4+PiAgICAgcm1kaXI6IGZhaWxl
ZCB0byByZW1vdmUgJ3N1Ymdyb3VwJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQo+Pj4+Cj4+
Pj4gVGhlIGtlcm5lbCB3YXMgdW5hYmxlIHRvIGNyZWF0ZSB0aGUgc3ViZ3JvdXAgKG1rZGlyIHJl
dHVybmVkIC1FTk9NRU0pCj4+Pj4gZHVlIHRvIHRoaXMgYWRkaXRpb25hbCBwZXItbm9kZSBrZXJu
ZWwgbWVtb3J5IGFsbG9jYXRpb25zLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBjYW5vbmljYWwuY29tPgo+Pj4+IC0tLQo+
Pj4+ICAuLi4vY29udHJvbGxlcnMvbWVtY2cvZnVuY3Rpb25hbC9tZW1jZ19saWIuc2ggfCA0NCAr
KysrKysrKysrKysrKysrKysrCj4+Pj4gIC4uLi9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX3N1Ymdy
b3VwX2NoYXJnZS5zaCB8ICA4ICstLS0KPj4+PiAgLi4uL2Z1bmN0aW9uYWwvbWVtY2dfdXNlX2hp
ZXJhcmNoeV90ZXN0LnNoICAgIHwgIDggKysrLQo+Pj4+ICAzIGZpbGVzIGNoYW5nZWQsIDUyIGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvdGVzdGNh
c2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFsL21lbWNnX2xpYi5zaCBiL3Rl
c3RjYXNlcy9rZXJuZWwvY29udHJvbGxlcnMvbWVtY2cvZnVuY3Rpb25hbC9tZW1jZ19saWIuc2gK
Pj4+PiBpbmRleCBkYWQ2NmM3OThlMTkuLjcwMGU5ZTM2N2JmZiAxMDA3NTUKPj4+PiAtLS0gYS90
ZXN0Y2FzZXMva2VybmVsL2NvbnRyb2xsZXJzL21lbWNnL2Z1bmN0aW9uYWwvbWVtY2dfbGliLnNo
Cj4+Pj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9jb250cm9sbGVycy9tZW1jZy9mdW5jdGlvbmFs
L21lbWNnX2xpYi5zaAo+Pj4+IEBAIC02Myw2ICs2Myw1MCBAQCBtZW1jZ19yZXF1aXJlX2hpZXJh
cmNoeV9kaXNhYmxlZCgpCj4+Pj4gIAlmaQo+Pj4+ICB9Cj4+Pj4gIAo+Pj4+ICsjIEtlcm5lbCBt
ZW1vcnkgYWxsb2NhdGVkIGZvciB0aGUgcHJvY2VzcyBpcyBhbHNvIGNoYXJnZWQuICBJdCBtaWdo
dCBkZXBlbmQgb24KPj4+PiArIyB0aGUgbnVtYmVyIG9mIENQVXMgYW5kIG51bWJlciBvZiBub2Rl
cy4gRm9yIGV4YW1wbGUgb24ga2VybmVsIHY1LjExCj4+Pj4gKyMgYWRkaXRpb25hbGx5IHRvdGFs
X2NwdXMgKHBsdXMgMSBvciAyKSBwYWdlcyBhcmUgY2hhcmdlZCB0byB0aGUgZ3JvdXAgdmlhCj4+
Pj4gKyMga2VybmVsIG1lbW9yeS4gIEZvciBhIHR3by1ub2RlIG1hY2hpbmUsIGFkZGl0aW9uYWwg
MTA4IHBhZ2VzIGtlcm5lbCBtZW1vcnkKPj4+PiArIyBhcmUgY2hhcmdlZCB0byB0aGUgZ3JvdXAu
Cj4+Pj4gKyMKPj4+PiArIyBBZGp1c3QgdGhlIGxpbWl0IHRvIGFjY291bnQgc3VjaCBwZXItQ1BV
IGFuZCBwZXItbm9kZSBrZXJuZWwgbWVtb3J5Lgo+Pj4+ICsjICQxIC0gdmFyaWFibGUgbmFtZSB3
aXRoIGxpbWl0IHRvIGFkanVzdAo+Pj4+ICttZW1jZ19hZGp1c3RfbGltaXRfZm9yX2ttZW0oKQo+
Pj4+ICt7Cj4+Pj4gKwlbICQjIC1uZSAxIF0gJiYgdHN0X2JyayBUQlJPSyAibWVtY2dfYWRqdXN0
X2xpbWl0X2Zvcl9rbWVtIGV4cGVjdHMgMSBwYXJhbWV0ZXIiCj4+Pj4gKwlldmFsICJsb2NhbCBf
bGltaXQ9XCQkMSIKPj4+Cj4+PiBDb3VsZCB3ZSBkbyB0aGlzIGEgc2ltcGxlciB3YXk/Cj4+Pgo+
Pj4gSXQgd291bGQgYmUgbXVjaCBlYXNpZXIgdG8gcmVhZCBpZiB3ZSBqdXN0IHJldHVybmVkIHRo
ZSB2YWx1ZSB3aGljaAo+Pj4gbmVlZGVkIHRvIGJlIGFkZGVkLgo+Pgo+PiBTdXJlLCBJIGNhbiBj
aGFuZ2UgaXQuIEp1c3Qgbm90ZSB0aGF0IHRoZSBjYWxsZXIvdXNlciB3aWxsIHJlcXVpcmUKPj4g
c2xpZ2h0bHkgbW9yZSBjb2RlLgo+IAo+IFRoYW5rcywgeWVzLiBJIHRoaW5rIGEgdmVyeSBsYXJn
ZSBjb2RlIHNhdmluZyB3b3VsZCBiZSByZXF1aXJlZCB0bwo+IGp1c3RpZnkgdXNpbmcgZXZhbCBp
biB0aGlzIHdheS4KCkFjdHVhbGx5IEkgd2FzIHdyb25nIGFuZCBjYWxsZXIgaXMgYWxzbyBzbWFs
bGVyLCBzbyBuZXcgc29sdXRpb24gbG9va3MKbXVjaCBiZXR0ZXIuIEknbGwgc2VuZCBzb29uLiBU
aGFua3MgZm9yIHJldmlldyEKCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKLS0gCk1haWxpbmcg
bGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

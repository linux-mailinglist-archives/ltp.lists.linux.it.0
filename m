Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPPGFV/QeWk0zwEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 10:01:19 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E389E8F6
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 10:01:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769590863; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=j5YgEeBnl7GpXYkVC99sXsmyuAofibvdDm4MG9gpidU=;
 b=pduXqo9n58yNevxg3EREAzv8np/jc3RiYhPEjfKmSCM/1u44w63lwvL34cSbFGEJGyviY
 704Y98kLxp5woSSimzUS0uaAJDRKtF4lG8pF7PuPhsVuenuZAv8YcDcaB/49A2FVN3TJTW5
 mwu9D3AYADxbv7Hylc/LBSRefY6F77c=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56DEB3CAE57
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 10:01:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 75F1A3C30CD
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 10:00:50 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5F439600A65
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 10:00:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769590845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OMlSiPP5NYyMZfhJtrvYB7nsy0U6l0WbPDsCDvg6eQQ=;
 b=Va8AG7CWqFUXIX47zOCoget5kXmp1LmOfOtKIJIj2zOVHu1aDGnXJX5tOH/kV/siBQqeDi
 m2RQ7DyIsv3a4z25CidTOrXZvBuq38FB5feQyB/cFGTxG8pFMRR2owWqTf7JJ65KjV3hL9
 x6HdQjwFDU39hEi4nfGZoKJYMC8rmCM=
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-W7exrvouNbS4aowUXgBcWg-1; Wed, 28 Jan 2026 04:00:42 -0500
X-MC-Unique: W7exrvouNbS4aowUXgBcWg-1
X-Mimecast-MFC-AGG-ID: W7exrvouNbS4aowUXgBcWg_1769590841
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-2b6b9c1249fso12378050eec.1
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 01:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769590841; x=1770195641;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OMlSiPP5NYyMZfhJtrvYB7nsy0U6l0WbPDsCDvg6eQQ=;
 b=huvmkqCpXdJXCRR2Vg9w4/iTyPxhcwBXH0H03SGvcr9VrklVReqWzTjnoWiX1t66Y3
 VzsWalSZpG1ZYPp7yuhxJkX9dpH+ZBKU5EGcOSjFDw3frHPVAFl+J5IC1Y9hNphTOKia
 OqpJ6+jxz6SjcEZcKKdOim9iyQg4VgpSa94AoUjO9eyfN5XaBl3eNd5p9Dgyrk7tLzvG
 iyMfZbWanH7IOeAkiWatH8m3Ib20zi+eSek5/sEoW9q8k7akOLb/SA58Y4/Xu16GNUXM
 GJmnlfXMk2vOmM78ng3TS8DIIqkiwGu+/cWMJiI8FoFbjaIi2oiklKF0q6qxsUZqQ+QV
 ZJCA==
X-Gm-Message-State: AOJu0YwBGHaJM8c7pC3noFrfjtzhgS2gR/C5BFZkSXeWya0UupM12l2Q
 G2pAqRflVBFdL4aWptPbDwmk2SuAuphjV8lOFCoooHq5TJkfAi5f44R2HT+yy6gBLC9pEme65NY
 6SSImqHvntUODfBXXD1hxJUDDbYvAaS0rqe0U0TDxtP6nRMHlt4E8UTkVp8elulEfBTDOljQzbJ
 n6LVB9T5W2Pft+9oRUmCF2pBkn3vU=
X-Gm-Gg: AZuq6aJI+wtel7H9ae9JJzVcoQNAL/PCcfLqiqHl9axbIJ1zHKMSCmzfPtfWLHwdvfh
 ljRW7Dd4wTWIaUz0pv3PCfKR9wE5tDBXlHRvjs7tTSlP2UJur9Dj6ALOQzwsAw7AN7rZ0bgZBbC
 Wgc84oWqxhmWooggUBTSPi1suIKf5NXfaAbDcDsD8sZxFYLPVigGX66RtNgAYsqL1s120=
X-Received: by 2002:a05:7300:ad09:b0:2ae:5dc2:3b11 with SMTP id
 5a478bee46e88-2b78d8ccedbmr2778121eec.2.1769590840869; 
 Wed, 28 Jan 2026 01:00:40 -0800 (PST)
X-Received: by 2002:a05:7300:ad09:b0:2ae:5dc2:3b11 with SMTP id
 5a478bee46e88-2b78d8ccedbmr2778044eec.2.1769590839298; Wed, 28 Jan 2026
 01:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20260128080121.18878-1-pvorel@suse.cz>
In-Reply-To: <20260128080121.18878-1-pvorel@suse.cz>
Date: Wed, 28 Jan 2026 17:00:25 +0800
X-Gm-Features: AZwV_QhWXX_M4OgfD_yNiqAbH-qdNfV12bIrmxlvkXfnYftnd2hjAnXJzYckdaM
Message-ID: <CAEemH2ef_LQ_SbmmWM2nfsacn9y94eCzC7GVjcz7EggtbnfVYw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dVBJQMOvPN8MV9UPvatrYaWQ-7VPWjUSZ637yPbu7wA_1769590841
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH 1/1] doc/ground_rules: Add Kernel features check
 rules
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RSPAMD_URIBL_FAIL(0.00)[lists.linux.it:query timed out,suse.cz:query timed out,linux.it:query timed out];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	ASN_FAIL(0.00)[2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.5.0.0.0.0.1.0.0.8.1.4.1.1.0.0.2.asn6.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	TAGGED_RCPT(0.00)[linux-ltp];
	RSPAMD_EMAILBL_FAIL(0.00)[liwang.redhat.com:query timed out,pvorel.suse.cz:query timed out];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	MISSING_XM_UA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.it:url]
X-Rspamd-Queue-Id: 22E389E8F6
X-Rspamd-Action: no action

SGkgUGV0ciwKCkdlbmVyYWxseSBsb29rcyBnb29kLCBqdXN0IGEgZmV3IGNvbW1lbnRzIHRvIHBv
bGlzaCBpdC4KClJldmlld2VkLWJ5OiBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KCgpPbiBX
ZWQsIEphbiAyOCwgMjAyNiBhdCA0OjAx4oCvUE0gUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+
IHdyb3RlOgoKPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5jej4KPiAt
LS0KPiBCYXNlZCBvbiBhIGRpc2N1c3Npb24gdmFyaW91cyBkaXNjdXNzaW9uczoKPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9sdHAvMjAyNjAxMjMxMjI1NDUuR0ExMjIzMzFAcGV2aWsvCj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbHRwLzIwMjYwMTI4MDcyNDQ1LkdCMTM0OTVAcGV2aWsvCj4K
PiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+Cj4gIGRvYy9kZXZlbG9wZXJzL2dyb3VuZF9ydWxlcy5y
c3QgfCAxNyArKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RvYy9kZXZlbG9wZXJzL2dyb3VuZF9ydWxlcy5yc3QKPiBi
L2RvYy9kZXZlbG9wZXJzL2dyb3VuZF9ydWxlcy5yc3QKPiBpbmRleCAwNWU0NzNjYWQ1Li45MGZl
N2E2NGVlIDEwMDY0NAo+IC0tLSBhL2RvYy9kZXZlbG9wZXJzL2dyb3VuZF9ydWxlcy5yc3QKPiAr
KysgYi9kb2MvZGV2ZWxvcGVycy9ncm91bmRfcnVsZXMucnN0Cj4gQEAgLTE3NCwzICsxNzQsMjAg
QEAgVGhlc2UgcGF0Y2hlcyBzaG91bGQgYWxzbyBhZGQgYSBbU1RBR0lOR10ga2V5d29yZAo+IGlu
dG8gdGhlIHBhdGNoIHN1YmplY3QsIGUuZy4KPiAgSW4gYSBjYXNlIHRoYXQgYSB0ZXN0IGZvciB1
bnJlbGVhc2VkIGtlcm5lbCBpcyByZWFsbHkgbmVlZGVkIHRvIGJlIG1lcmdlZAo+IHdlIGRvCj4g
IG5vdCBhZGQgaXQgdG8gdGhlIGxpc3Qgb2YgdGVzdCBleGVjdXRlZCBieSBkZWZhdWx0IGFuZCBr
ZWVwIGl0IGluCj4gIDptYXN0ZXI6YHJ1bnRlc3Qvc3RhZ2luZ2AgZmlsZSB1bnRpbCB0aGUga2Vy
bmVsIGNvZGUgaXMgZmluYWxpemVkLgo+ICsKPiArS2VybmVsIGZlYXR1cmVzIGNoZWNrCj4gKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ICsKPiArV2UgcHJlZmVyIHRvIHVzZSA6Yzp0eXBlOmAubmVl
ZHNfa2NvbmZpZ3MgPHRzdF90ZXN0PmAgKGtlcm5lbCBrY29uZmlnCj4gY2hlY2spLgo+ICtCdXQg
ZG8gKm5vdCogdXNlIGl0IHdoZW4gdGhlcmUgaXMgYW5vdGhlciB3YXkgdG8gZGV0ZWN0IHRoZSBm
dW5jdGlvbmFsaXR5Cj4gKGUuZy4KPiArdmlhIGRldGVjdGluZyBmdW5jdGlvbmFsaXR5IHZpYSBg
YC9wcm9jfHN5c2BgKSAqYW5kKiBhbnkgb2YgdGhlc2UgcnVsZXMKPiBhcHBsaWVzOgo+CgpQZXJo
YXBzIHJlcGxhY2UgImRldGVjdCIgd2l0aCAiaW1wYWN0Ij8KCgoKPiArLSBLZXJuZWwgYWxsb3dz
IHRvIGRpc2FibGUgZnVuY3Rpb25hbGl0eSB2aWEgYGtlcm5lbOKAmXMgY29tbWFuZC1saW5lCj4g
cGFyYW1ldGVyCj4gKyAgPAo+IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0
L2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLmh0bWwKPiA+YF8KPiArICAoaXQgY2FuIGJl
IGRpc2FibGVkIGluIHJ1bnRpbWUpLgo+CgotIFJ1bnRpbWUtZGlzYWJsZSBwb3NzaWJsZToga2Vy
bmVsIGV4cG9zZXMgYSBjb21tYW5kLWxpbmUgcGFyYW1ldGVyCiAgIChvciBydW50aW1lIGtub2Ip
IHRoYXQgY2FuIGVuYWJsZS9kaXNhYmxlIHRoZSBmdW5jdGlvbmFsaXR5LCBzbyBhCmJ1aWxkLXRp
bWUKICAga2NvbmZpZyBkb2VzIG5vdCByZWZsZWN0IHJ1bnRpbWUgYXZhaWxhYmlsaXR5LgoKKy0g
SXQncyBhIGNoZWNrIGZvciBhIGZ1bmN0aW9uYWxpdHkgd2hpY2ggY2FuIGJlIGNvbXBpbGVkIGFz
IG1vZHVsZQo+ICsgIChgdHJpc3RhdGUKPiArICA8aHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcva2J1
aWxkL2tjb25maWctbGFuZ3VhZ2UuaHRtbCNtZW51LWF0dHJpYnV0ZXMKPiA+YF8sCj4gKyAgbW9k
dWwgbWlnaHQgbm90IGJlIGF2YWlsYWJsZSkuCj4KCi0gVHJpc3RhdGUvbW9kdWxlIGZlYXR1cmU6
IFRoZSBmdW5jdGlvbmFsaXR5IGlzIGNvbnRyb2xsZWQgYnkgYQogICBgdHJpc3RhdGUgPApodHRw
czovL2RvY3Mua2VybmVsLm9yZy9rYnVpbGQva2NvbmZpZy1sYW5ndWFnZS5odG1sI21lbnUtYXR0
cmlidXRlcz5gXwogICAgb3B0aW9uIChpLmUuIGl0IG1heSBiZSBidWlsdCBhcyBhIG1vZHVsZSks
IGFuZCB0aGUgbW9kdWxlIG1pZ2h0IG5vdCBiZQpwcmVzZW50CiAgICBvciBsb2FkZWQgYXQgcnVu
dGltZS4KCgo+ICstIE5ldyBrZXJuZWwgZnVuY3Rpb25hbGl0eSB3aGljaCBpcyB1bmxpa2VseSB0
byBiZSBiYWNrcG9ydGVkICh1c2UKPiArICA6Yzp0eXBlOmAubWluX2t2ZXIgPHRzdF90ZXN0PmAg
aW5zdGVhZCkuCgoKLSBOZXcgbm9uLWJhY2twb3J0ZWQgZnVuY3Rpb25hbGl0eTogVGhlIHRlc3Qg
dGFyZ2V0cyBhIG5ldyB1cHN0cmVhbSBrZXJuZWwKZmVhdHVyZQogICB0aGF0IGlzIHVubGlrZWx5
IHRvIGJlIGJhY2twb3J0ZWQuIFByZWZlciA6Yzp0eXBlOmAubWluX2t2ZXIgPHRzdF90ZXN0PmAK
Zm9yIGdhdGluZwogICBpbnN0ZWFkIG9mIEtjb25maWcgc3ltYm9scy4KCgotLSAKUmVnYXJkcywK
TGkgV2FuZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=

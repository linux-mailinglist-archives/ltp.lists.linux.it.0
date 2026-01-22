Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLRDAGD+cWmvZwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 11:39:28 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C248655C3
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 11:39:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769078367; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=741r0GwWCo2F/cHIX2Q/8zX+BWtONKSm/Cu9Pmo3a+g=;
 b=ehW8LUfchWRbe9EzLq+KtjUbU1A6EL0iMKzWOgJM+O9IQlQ3fW1+FpyXUlwqbwbquBDOz
 jBiITVIM4tGdOTztDxgwX4HS6InNtLMV9kblKosxQm20hm7awTM+YWfWWEkp8EyhCCLG1cP
 GaIHp+/nhBoic8ltRXEhQoGsjIRaroU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 297683CB3F0
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 11:39:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C992F3C1428
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 11:39:15 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1D07D600845
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 11:39:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769078350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4vGrDNhQOG2R2qo6EaPzFTYvtA7y1nYSOjZlLLMMeRM=;
 b=JdRe/1EqkIBi0Ghx8gm4dvOuFkPeo0CfUAVRWH+t4zLdnEG2gFCmxAwNN4LAq+09m7NiAO
 dQGG7kMo3B4Xl7qyBwCHeRJUQbJH57eR3hC9GmeiSWoCTMkOpIgqkpTQSpQpCmHnd73rH/
 qjPBEOcqbQ+Riaob2f9jIn6QUOKXqMI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-CCEIcxUJPDCHezhcJ4S_Tg-1; Thu, 22 Jan 2026 05:39:08 -0500
X-MC-Unique: CCEIcxUJPDCHezhcJ4S_Tg-1
X-Mimecast-MFC-AGG-ID: CCEIcxUJPDCHezhcJ4S_Tg_1769078348
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-4359d70faa2so546755f8f.1
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 02:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769078347; x=1769683147;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4vGrDNhQOG2R2qo6EaPzFTYvtA7y1nYSOjZlLLMMeRM=;
 b=j1PUSKK/P3cu2iHZw4sLMJaHRzu0d0zb6vgC++ts8f1eXVQ7UrZMeLuX/TGVpEXos2
 4Xg6ujvmekNdqwjCcsdQfArcIs849yBPTU17HPjiBykckMm5BqPlbdAKSV+wkewoiC/O
 ul5juYBrpSJuxvBF8Zn8KGUwOTFiZ5+J6aWmEfvwGQ/s8kBSzFlquHytLzp3pqFSDL1z
 B1SneSD5lkWBcBdEFz49Tz2iGbinzndPkAf9Bh/s+NyFhzqfhUk4Y+oA2Z5IXtgPUAz9
 jahhzOFb6+rPcnfXzlxqAKruH+yKMvO2RFGeME9nEcP88mC/DYh7nQner2qtXqtheIQ6
 b2Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkr5rWELM2I/TTKJwuviK3jMHGssJLVhIMFV9XgH3XvCX14PnSCth0TjcUh/jHlfIdM58=@lists.linux.it
X-Gm-Message-State: AOJu0Yy4+IVfWT2ih46A8f5VHJSTl9Ze/mtiG9c68C+tKIiBFhac6iSR
 4rpQylD1va9ghOGMrDEb8Z18k/jULHrHNV2nboFpH/qmJb5h8LN84epXxw1KbkW2eDU/ynwGahU
 brnyZuvyNdWRY01yo7SASvt47LQUf3KB2QYsxl3VYDdyM9EzNh84yqKU3iPpk3KRZsoPZ2xqj6J
 KdRxJXOwSkgKCgxoeUkj8/NlrqJ5Q=
X-Gm-Gg: AZuq6aIjOSmpFPne9GjJ4U+t2qV5rjrZD0rdYDQXh/ZIX1r7V/Brbt3ZlrDjZtEXBY9
 W7h1vFaVyh3YnfCz/LiWjSY5LQ4fECDfqUwsAEhUAfMYO4KNfZAA3w7ungDxdUtK3pECCb7UevH
 U4NmJmnDntt6c32Ya/eAfvRmSiDSd9SgM1nMbnjQ/cyclBHMsBE3TYiGqiIpSnWqwRpg==
X-Received: by 2002:a5d:5f95:0:b0:431:266:d134 with SMTP id
 ffacd0b85a97d-4356a05d66amr35471214f8f.53.1769078347598; 
 Thu, 22 Jan 2026 02:39:07 -0800 (PST)
X-Received: by 2002:a5d:5f95:0:b0:431:266:d134 with SMTP id
 ffacd0b85a97d-4356a05d66amr35471180f8f.53.1769078347192; Thu, 22 Jan 2026
 02:39:07 -0800 (PST)
MIME-Version: 1.0
References: <aWjZX0fsrTJMqq49@yuki.lan> <20260116072020.GB556902@pevik>
In-Reply-To: <20260116072020.GB556902@pevik>
Date: Thu, 22 Jan 2026 11:38:50 +0100
X-Gm-Features: AZwV_QidvuGMUvrSXvzDlp-MvBWAew7rTd1Ct7_pv7WnX5X_NLPDx9WIjEjZfAc
Message-ID: <CAASaF6xyVVTFtLHcyicMZsmiBhiq5f16d-nhHTfLw3Nis_TKPg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ueUJKEjgmBqRzD5ZIxL1D3LSsU0TCKVy6xFXFRAijdQ_1769078348
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] LTP release preprations
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
From: Jan Stancek via ltp <ltp@lists.linux.it>
Reply-To: Jan Stancek <jstancek@redhat.com>
Cc: Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it,
 Liu Jian <liujian56@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[jstancek@redhat.com];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.cz:email,checkpatch.pl:url,ozlabs.org:url,picard.linux.it:helo,picard.linux.it:rdns,mail.gmail.com:mid,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 7C248655C3
X-Rspamd-Action: no action

T24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgODoyMOKAr0FNIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNl
LmN6PiB3cm90ZToKPgo+IEhpIEN5cmlsLCBhbGwsCj4KPiA+IEhpIQo+ID4gSXQncyBhYm91dCB3
ZSBzdGFydCB0byBwcmVwYXJlIGZvciB0aGUgSmFudWFyeSByZWxlYXNlLiBXZSBoYXZlIHJvdWdo
bHkKPiA+IGEgd2VlayBmb3IgZ2V0dGluZyBpbiBhbGwgcGF0Y2hlcyB0aGF0IHNob3VsZCBnbyBp
bi4gU28gaWYgdGhlcmUgaXMKPiA+IGFueXRoaW5nIHRoYXQgc2hvdWxkIGJlIHJldmlld2VkIHBs
ZWFzZSBwb2ludCBpdCBvdXQgQVNBUC4KPgo+ID4gQXMgZm9yIG1lIEknbSBnb2luZyB0byAoaG9w
ZWZ1bGx5KSBmaW5hbGl6ZSB0aGUgZ3JvdW5kIHJ1bGVzIHBhdGNoIGFuZAo+ID4gc2VuZCBhbm90
aGVyIHZlcnNpb24gdG9kYXkuCj4KPiBJIHBsYW4gdG8gbWVyZ2UgdG9kYXkgTWFydGluJ3MgZml4
IGZvciBsaW9fbGlzdGlvLzItMS5jOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2x0cC8yMDI2
MDExNTE3MTg0Ny4yODA5MS0xLW1kb3VjaGFAc3VzZS5jei8KPgo+IEkgaG9wZSB3ZSBjb3VsZCBt
ZXJnZSB1c2VyZmF1bHRmZCByZXdyaXRlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC10ZXN0
LXByb2plY3QvbHRwL3B1bGwvMTI4MAo+Cj4gSG9wZWZ1bGx5IHY3ICJuZXcgY21kIHN1cHBvcnQg
b3B0aW9uIGZvciBuZWVkc19jbWRzIiBpcyByZWFkeSBub3c6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbHRwLzIwMjYwMTA5MDYxNzE2LjIwMjU4LTEtd2VnYW9Ac3VzZS5jb20vCj4KPiBpb2N0
bF9waWRmZDAyLTA2OiBBZGQgQ09ORklHX1VTRVJfTlMgYW5kIENPTkZJR19QSURfTlMgdG8gbmVl
ZHNfa2NvbmZpZ3MKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbHRwL3Bh
dGNoLzIwMjUxMjA5MjExNjI5Ljk1NDM2LTEtdGVycnkudHJpdHRvbkBsaW5hcm8ub3JnLwo+IChJ
IHNvbWVob3cgYWdyZWUgd2l0aCBKYW4gdGhhdCBzb21ldGltZXMganVzdCBjaGVjayAvcHJvYyBv
ciAvc3lzIHBhdGggaXMgYmV0dGVyCj4gdGhhbiBpbXBseSBrY29uZmlnLCBidXQgbWFqb3JpdHkg
YWdyZWVkIHRvIHVzZSAubmVlZHNfa2NvbmZpZ3MpLgo+Cj4gTWF5YmUgZml4IGNsb25lMTAuYyBv
biAzMiBiaXQsIGlmIHdlIGZpbmQgYSByb290IGNhdXNlLiBUaGlzIGlzIGp1c3QgYW4KPiBpbnZl
c3RpZ2F0aW9uOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2x0cC9hV21xRkF6ZHRzUjB0NWFK
QGF1dG90ZXN0LXdlZ2FvLnFlLnByZzIuc3VzZS5vcmcvCgpDTE9ORV9TRVRUTFMgZXhwZWN0cyBk
aWZmZXJlbnQgcGFyYW1ldGVycyBvbiB4ODYgdnMgeDg2XzY0LCBJJ2Qgc2tpcAozMmJpdCB0ZW1w
b3JhcmlseSB1bnRpbCBpdCdzIHJlc29sdmVkLgoKPgo+IFdlIGdvdCBubyBmdXJ0aGVyIHJlc3Bv
bnNlIGZvciBzb21lIFJQQyBmaXgsIEknbSBub3Qgc3VyZSBpZiBpdCdzIHJlYWR5Ogo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2x0cC8yMDI2MDExMjAxNTA0Ny4yMTg0MDAzLTEtbGl1amlhbjU2
QGh1YXdlaS5jb20vCj4KPiBJZiB3ZSBoYXZlIHRpbWU6Cj4gdHN0X2ZpbGVzeXN0ZW1zMDEuYzog
QWRkIHRlc3QgZm9yIC5maWxlc3lzdGVtcwo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9sdHAvbGlzdC8/c2VyaWVzPTQ4MTg4MSZzdGF0ZT0qCj4KPiBjaGVja3BhdGNoLnBs
IHVwZGF0ZQo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9sdHAvbGlzdC8/
c2VyaWVzPTQ4NzE3OSZzdGF0ZT0qCj4KPiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+Cj4gLS0KPiBN
YWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAKPgoK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

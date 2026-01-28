Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULdnBM/yeWnT1AEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 12:28:15 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 81622A060F
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 12:28:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769599694; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=ww8zZKbv9JJOHvGgEm7vaq8KKa1nr9aMuPnCTHV/KsM=;
 b=ZHi++OzsbjN7tAmmVXVfilTOG74ITrejaWb4na4tEZfl3Xz23ufj/mVsMIcG7qW8VTrV2
 h/eLlo7cz3VlnXZprZI35EbPl29d8Uddoj0xiXya9CJx9sSHQNCipgoQG/GQ7+pEg2frabU
 wjOrvp1EuJXjyNf2FrJ92RyAUIhUfmw=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 344A83CAFF7
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Jan 2026 12:28:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 42FEC3CAF61
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 12:28:09 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D558D1000A9B
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 12:28:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769599687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xaZrP7BljcmnfC6mB+gSIsWNR3zDH7L9p43qopj/Tlg=;
 b=QVqEgEVsajytGS+z+M+B2tFY4OPJ8f2g8jXqztMzBqnS4n6qo7M2hSNfw9VjRCObjPAoVy
 psMoPhvIMLaYGJ8oDSudeneecFKfiIemHZc8S0OQQpXlbrNuJTQ/4mXiRMeJv3upSPX1nB
 GERaL+UjvineP1xp8VXxI/irHAxIL38=
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-Cev1bg7nOlqwSggIgkcMQA-1; Wed, 28 Jan 2026 06:28:05 -0500
X-MC-Unique: Cev1bg7nOlqwSggIgkcMQA-1
X-Mimecast-MFC-AGG-ID: Cev1bg7nOlqwSggIgkcMQA_1769599684
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-2b7a28264c1so650631eec.0
 for <ltp@lists.linux.it>; Wed, 28 Jan 2026 03:28:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769599684; x=1770204484;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xaZrP7BljcmnfC6mB+gSIsWNR3zDH7L9p43qopj/Tlg=;
 b=JVLqpiiXpmPRVEqQc7yImemvZ038RBntFpbmvN4d8GK31Plw5avh6Inji1Hb0C6Gwl
 buU+7xC3CBo1e5LIYZu1kCc4cMOBIkZpBjAr8U+Eivd8yx1ks+D7giKl+kG9lSjYR++n
 GP2WKP0e4eCLzmVBDjWnU3/971AE91xXBXuSb9071Ho1ZZCuEWgOEfjbwkbbl0I2GlbD
 o1XFruTYfgWnRqj54oBpU2Ge338Suot7yuLK4gbeobzTDlBX2oHcsJYhFRXHra05x9gT
 ykT5N39FV4mJvp9jg5+sy0zTu1R7vHnTTQ0M98fGumWR5eqq4FkOCJ7+iyn/OObkXoxR
 c80Q==
X-Gm-Message-State: AOJu0Yzf8S/Q0cLnZreH/gz7jdJabizH2WrArs68OZFtn8oCNqoUyIv5
 d+M4SbvJK4wao1tCY2KD8Kw20DUmtVqotOMMOKGNVOzwUrbwwXcinL/xD4onWT/6PTKghfzSCyq
 q8+Juusr/zM/ygG2SmDDLPRQn1kesBCwtayYh8f/TqBPJ7fC1pNzYewD0+X0t3WxVfWLxBQWCnT
 quEsbO/2WwfPIA5LqsW+fyl5IzmDU=
X-Gm-Gg: AZuq6aIzuMr8d03RI91JV1iy/hALQu5ITtoXYwEu39tel6y482ZJyo7sTvIEtCj5isN
 egLWWcD9goypnK6GznrSMZK6MR/TCUxw04Z+3MEVoD4gFo9qMet6sbX4FLJP92xoLTROtxx/qy4
 6HSLRYuQ6Knm2+2W4VVeBXFHSSgINvI/bRfcr2dwrmpjcI+rsStlRZ1aHvbt+455TPHjY=
X-Received: by 2002:a05:7300:fd05:b0:2a4:65b5:9868 with SMTP id
 5a478bee46e88-2b78da689c2mr3233757eec.38.1769599683301; 
 Wed, 28 Jan 2026 03:28:03 -0800 (PST)
X-Received: by 2002:a05:7300:fd05:b0:2a4:65b5:9868 with SMTP id
 5a478bee46e88-2b78da689c2mr3233742eec.38.1769599682523; Wed, 28 Jan 2026
 03:28:02 -0800 (PST)
MIME-Version: 1.0
References: <20260128-kirk_v3-2-1-v1-1-9364f4bf919c@suse.com>
In-Reply-To: <20260128-kirk_v3-2-1-v1-1-9364f4bf919c@suse.com>
Date: Wed, 28 Jan 2026 19:27:50 +0800
X-Gm-Features: AZwV_QjUzK9x6HEfGR1HVbwhlrzsbUfaiNmF5EmvDjZZcCLkM8PSZpBTbFAmJRU
Message-ID: <CAEemH2c7WhKRntOZpZ4jPe43wG9NiQYz65CtcB1uo+ChejapAQ@mail.gmail.com>
To: Andrea Cervesato <andrea.cervesato@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CA1l3Ztk_0O-Gbclikj8Jk62JEOXbWKGq5DLdvCmuDg_1769599684
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] kirk: Update to v3.2.1
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
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	TAGGED_RCPT(0.00)[linux-ltp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,suse.com:email,linux.it:url,picard.linux.it:helo,picard.linux.it:rdns,suse.de:email]
X-Rspamd-Queue-Id: 81622A060F
X-Rspamd-Action: no action

T24gV2VkLCBKYW4gMjgsIDIwMjYgYXQgNjo0OeKAr1BNIEFuZHJlYSBDZXJ2ZXNhdG8gPGFuZHJl
YS5jZXJ2ZXNhdG9Ac3VzZS5kZT4Kd3JvdGU6Cgo+IEZyb206IEFuZHJlYSBDZXJ2ZXNhdG8gPGFu
ZHJlYS5jZXJ2ZXNhdG9Ac3VzZS5jb20+Cj4KPiBodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVz
dC1wcm9qZWN0L2tpcmsvcmVsZWFzZXMvdGFnL3YzLjIuMQo+ICogbHRwOiBjb3JyZWN0bHkgZmV0
Y2ggTFRQUk9PVCBieSBAYWNlcnYgaW4gIzg4Cj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWEgQ2Vy
dmVzYXRvIDxhbmRyZWEuY2VydmVzYXRvQHN1c2UuY29tPgo+CgpSZXZpZXdlZC1ieTogTGkgV2Fu
ZyA8bGl3YW5nQHJlZGhhdC5jb20+CgoKLS0gClJlZ2FyZHMsCkxpIFdhbmcKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

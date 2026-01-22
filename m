Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CM8vDeP6cWmvZwAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 11:24:35 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EC365351
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 11:24:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769077474; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=NPbiXC3JI90ekFiNMX4LZtERF3/8erf6AiwFAso+Pj0=;
 b=ZoZTet59+86lKu+0NYiXde9VRHzCUY6nczx9VXP1jWC2/BU7P3I1YSgphqNzkK8uvX6Hh
 LIDEyEPDwvmX/+ZyWYooApbMErlPuXmuFibrjFWvxtv7p+s7lQTNmdKrwsuTxexYbklQI+4
 JBHo5xXaTwR4/ud2zI3IArS8GGlymMo=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3340B3CB3C9
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 11:24:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4B2713CAFD9
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 11:24:20 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C87131A002EF
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 11:24:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769077458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=roX3TJ4YBT1Mg25WkW/NFq5lNq1RQnTUBbQ35LHAhho=;
 b=NQ37fwasOk/WLmXnBCQQv6+8GiMEoHI/JcrR/8pvffi8wvassv8aZMyxKe0KT/zPMBTE95
 WiVKIPKu6UoYgMVHP6oiHN7CRAdy75lbrNJLt3lEacr35yLyWmHwmZDmttjiDQCiksCW8V
 nS3k+h3HHXkwBngBL3R78ZI/7kfFS0U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-XP30bX9cMjCq8gUnyP8lBA-1; Thu, 22 Jan 2026 05:24:16 -0500
X-MC-Unique: XP30bX9cMjCq8gUnyP8lBA-1
X-Mimecast-MFC-AGG-ID: XP30bX9cMjCq8gUnyP8lBA_1769077455
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-43284f60a8aso561624f8f.3
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 02:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769077455; x=1769682255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=roX3TJ4YBT1Mg25WkW/NFq5lNq1RQnTUBbQ35LHAhho=;
 b=bSEJtbO99BUsDbcwmaXrZhukPuvWlXNXYXw4iF1HuhV5Fs2U9DYF4Ka1eyRfUFJ9cq
 JN5I0PDUvTx9ctjRG2L4Xzd1Bg5/r4ctuvQFmEVPzy3Qbp1jBk5ayE4OhWibkSGDVDSo
 N6Djboeg/6QdPJ0Hw4PG8ROk/BmtH+rt85ISnNoxN3no91agEgM3/tDaa7gZNzV0ZEAg
 IAStTAb4UHbxgnBSJetHXtuhZmtx4ZEA4OzT3qc87DrNolJ3ikJQz2nDTR88mbqti29m
 ncYysC4KujmwWZlBAB4CozawtJYckTJHndnC4OSYtNZy6CKvJoRIMMoMl1hxOSEGzdQI
 WRMw==
X-Gm-Message-State: AOJu0YztTwBWBbGixHJJNAJ1PtAs9GTquZl4dvJDFY6gZYyxNT7SXr0M
 ZwSyipKKcvjjeH2bahiGvPjsPwbTBuvoaS4mDtAMzpepi4EUWjrEteu4umxPpVdTxFtMuVaGaoG
 jZWuFwGxOkit1bN5HKKpMbkyxJoViI6CaWpwqDLNdMajDppLq9yBeux0yZsAW4vQ/6umVafNPbO
 Plk3jq6DWoPR0GpMsYn32anir44Cw=
X-Gm-Gg: AZuq6aIL5CIlxluu03IALnMmkcOxWPe5w9AqfX64FQQF7GfjgatKZbFI+nxnkFk/q7t
 vjUuJIvdGb2Ws4CFctHKGwhxN6nSL/BTUWPFI8W32kL/Gj3ZYm1XaXSSPRKrFAM5sbrOP6yl8B7
 lJLDE+zTgtZSSnLvVKMqHYezdAFy/4EiPK78PtuUvaczDE1kVFFefWTWvchRKYLHGhZw==
X-Received: by 2002:a05:6000:1786:b0:435:a370:2d71 with SMTP id
 ffacd0b85a97d-435a3702f47mr6536141f8f.33.1769077455139; 
 Thu, 22 Jan 2026 02:24:15 -0800 (PST)
X-Received: by 2002:a05:6000:1786:b0:435:a370:2d71 with SMTP id
 ffacd0b85a97d-435a3702f47mr6536103f8f.33.1769077454680; Thu, 22 Jan 2026
 02:24:14 -0800 (PST)
MIME-Version: 1.0
References: <20251012194946.370905-1-petr.vorel@gmail.com>
 <20251012194946.370905-2-petr.vorel@gmail.com>
In-Reply-To: <20251012194946.370905-2-petr.vorel@gmail.com>
Date: Thu, 22 Jan 2026 11:23:57 +0100
X-Gm-Features: AZwV_Qi1LGwYZeeHM7uBdHtkRopzxSf2_aDaFDceJCeglhbX1fvuEeqp6dMU_No
Message-ID: <CAASaF6zDpHVZoLnQM90bKuHFPjKozgmmx7qq=LLbDvisbbEHog@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WiEyJW87Ti5BURB9Txek9EyuHOhlYzciJrqvjnNNO4c_1769077455
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/2] m4: mprotect04: Replace
 __builtin___clear_cache with __clear_cache
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
Cc: Hui Min Mina Chou <minachou@andestech.com>, Khem Raj <raj.khem@gmail.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[andestech.com,gmail.com,lists.linux.it];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	HAS_REPLYTO(0.00)[jstancek@redhat.com];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	MISSING_XM_UA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 87EC365351
X-Rspamd-Action: no action

T24gU3VuLCBPY3QgMTIsIDIwMjUgYXQgOTo1MOKAr1BNIFBldHIgVm9yZWwgPHBldHIudm9yZWxA
Z21haWwuY29tPiB3cm90ZToKPgo+IF9fY2xlYXJfY2FjaGUoKSBzaG91bGQgYmUgcXVpdGUgY29t
bW9uIG5vdyBhbmQgd2UgYWxyZWFkeSB1c2UgaXQgaW4KPiBodWdlbW1hcDE1LmMuIENvbnZlcnQg
YXV0b3Rvb2xzIG00IGNoZWNrIHRvIGRldGVjdCBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFBldHIg
Vm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgo+IC0tLQoKVG8gc2VyaWVzOgpBY2tlZC1ieTog
SmFuIFN0YW5jZWsgPGpzdGFuY2VrQHJlZGhhdC5jb20+CgoKLS0gCk1haWxpbmcgbGlzdCBpbmZv
OiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

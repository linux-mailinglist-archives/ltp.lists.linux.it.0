Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDZfJl1UfGnTLwIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 07:49:01 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1FB7B30
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 07:49:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769755740; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=lMrGCuBzwgLu02K3U4oWAP6QQTfs3wZBwPgBCyRq+CA=;
 b=Nw/X9QOk0oZeRGynEmXiJExeUwrv9DgJgeP/mB280Yu10vKg89DEDH5V4on18TbRtx4Kj
 JzZ/u6Cd25GwVYkSFKHuGb6b2Omy7CZlbdm+9F8xuKz58tm9dfoJJMtKFGuXQuuTaggzsN5
 xPGAw/jdYFap94nnSIQscgSHBHb+0a0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B3EE53CBED6
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 07:49:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 88AB93C99DA
 for <ltp@lists.linux.it>; Fri, 30 Jan 2026 07:48:57 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A79B31000D97
 for <ltp@lists.linux.it>; Fri, 30 Jan 2026 07:48:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769755734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HoSWpH5/1M7G1CXmCXYoo1ZOcr4sDKa5OT3sqnkTm2o=;
 b=SOg5lKIZurxq+i4cxbKQ3A1HimY+y1ydrYM5TgyL5C5OjQ+4qXX+16IV1ol44kbbpFBmRm
 dz3hQqzFp6vVpz+HYKmWLMNmcJ6yi3GBprzaLkt7q6lmlXGDao1WufXp/clLCQh888SQMu
 8zuKZKFrBEE1rv6Cg0leaTNsMinFup0=
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-HOK74RHgMRaqRjnJcAQKXQ-1; Fri, 30 Jan 2026 01:48:52 -0500
X-MC-Unique: HOK74RHgMRaqRjnJcAQKXQ-1
X-Mimecast-MFC-AGG-ID: HOK74RHgMRaqRjnJcAQKXQ_1769755732
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2b795cff830so10226003eec.1
 for <ltp@lists.linux.it>; Thu, 29 Jan 2026 22:48:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769755731; x=1770360531;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HoSWpH5/1M7G1CXmCXYoo1ZOcr4sDKa5OT3sqnkTm2o=;
 b=DzbY7KSzJWy8SrkDVJNlxrudlwvDk1yS+KI2D3ENISbFiR2J11xTdM9YntJm5V0bHG
 eGRGMjGi2rmCkK7G9nyzMj20u53dlfqi+tN2KeThK5zOYlqDlCtdNDjMDEo5iL0uxVC6
 2/7pwrWi7TFuNl5YOtF6i5UaC1YfmBghSVlIiZTuq4paLkvBsdxL076Ky7ZBtUFir8N1
 6OiU3SXqiSqDO2YCJ4gjmuOiSe1dgwj0CwzovOsUfW1bMJofgEvM4vsIMaE2SCTvNFfG
 WPno0U8DdVdBW2erURk0DVTpR2LN2a/VCIr/y1xjtlun08X9bAAqXVyl+lmqf2Py3NY0
 wDgQ==
X-Gm-Message-State: AOJu0YzALPY2nV00t63FPInHCX1W/Swor8m3Hz0BG3FSBk/IiPCzx3f+
 Pfm1gMYd8tWfW0pcjHNR+fEcixvbzTm+vaD5kjG/r4XccKlIiIhH2kAiKwRpZ4f2WWERJVTkwc3
 Sltsav1e0LJP1L7OnbOjq7Eu+s9L/tegCt1UYFK/V8pCRwpq18Nvr3zqWl5++BcfJ9T6VQjXesc
 4cIOAnxs5UDZYQdm6hugkepfUMRk0=
X-Gm-Gg: AZuq6aJqvlf0kuNDaTL05m671R0Tm0b82yVjj/iQJ/K8ql3ohXNNk/URq4dFHGlYMQd
 mUQKt97qNJ/qTpPcGovxX/VvZ+eWaJFJDd6S3hZ6X/45A6S55S8BGdBS1UEIUpWtEed6oJHOZuQ
 0hI99f94yEOJeJTseeqyAgcY4r/nkueiUZfKqTw0PdKgm5ZCsx2IwsESLGUYKSoT8Rg2M=
X-Received: by 2002:a05:693c:360b:b0:2ab:f56e:bea6 with SMTP id
 5a478bee46e88-2b7c894945fmr857479eec.39.1769755731521; 
 Thu, 29 Jan 2026 22:48:51 -0800 (PST)
X-Received: by 2002:a05:693c:360b:b0:2ab:f56e:bea6 with SMTP id
 5a478bee46e88-2b7c894945fmr857471eec.39.1769755731138; Thu, 29 Jan 2026
 22:48:51 -0800 (PST)
MIME-Version: 1.0
References: <20260130002041.124571-1-pvorel@suse.cz>
In-Reply-To: <20260130002041.124571-1-pvorel@suse.cz>
Date: Fri, 30 Jan 2026 14:48:39 +0800
X-Gm-Features: AZwV_QgJWib5yYvgFy88a79NryIm9rpIMv9aoFtchSUiw8quQbXtLJMK5a85I88
Message-ID: <CAEemH2eSTwvneeUuAmQ=SjqqXXOxmZ=atMZ85GKVEXwwCpd-tA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oo-ihLcXDKE_-0FoyP0iv5oPh4CjjSNr9FxTiVkeP_U_1769755732
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH 1/1] pidns: ioctl: unshare05: Require kconfig
 CONFIG_PID_NS
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
Cc: ltp@lists.linux.it, Terry Tritton <terry.tritton@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,picard.linux.it:helo,picard.linux.it:rdns,suse.cz:email,linux.it:url]
X-Rspamd-Queue-Id: 30A1FB7B30
X-Rspamd-Action: no action

T24gRnJpLCBKYW4gMzAsIDIwMjYgYXQgODoyMOKAr0FNIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNl
LmN6PiB3cm90ZToKCj4gQ0xPTkVfTkVXUElEIGZsYWcgcmVxdWlyZSBrY29uZmlnIENPTkZJR19Q
SURfTlMuIEZvbGxvd3VwIHRvIDZhYTRkMGUwOGYuCj4KPiBTaWduZWQtb2ZmLWJ5OiBQZXRyIFZv
cmVsIDxwdm9yZWxAc3VzZS5jej4KPgoKUmV2aWV3ZWQtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRo
YXQuY29tPgoKLS0tCj4gUHJvYmFibHkgYWZ0ZXIgdGhlIHJlbGVhc2UuCj4KPiBJJ20gbm90IHN1
cmUgYWJvdXQgdGhlc2UgMywgcHJvYmFibHkgdGhleSBhbHNvIHJlcXVpcmUgaXQ6Cj4gdGVzdGNh
c2VzL2tlcm5lbC9zeXNjYWxscy9jbG9uZS9jbG9uZTExLmMKPiB0ZXN0Y2FzZXMva2VybmVsL3N5
c2NhbGxzL2Nsb25lMy9jbG9uZTMwMS5jCj4gdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9jbG9u
ZTMvY2xvbmUzMDQuYwo+CgpJIHRoaW5rIHRoZSBhbnN3ZXIgaXMgWWVzLgoKCj4gVGhpcyBvbmUg
Y2hlY2tzIGZvciAiL3Byb2Mvc2VsZi9ucy9waWQiLCBidXQgaXQgd291bGQgbm90IGhhcm0gdG8g
YWRkCj4ga2NvbmZpZyBhcyB3ZWxsCj4gdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9pb2N0bC9p
b2N0bF9uczAxLmMKPgoKKzEsIGFuZCB3ZSBjb3VsZCBkcm9wIHRoZSBjaGVja3Mgb25jZSB3ZSBo
YXZlIGtjb25maWcgaG9va3MuCgotLSAKUmVnYXJkcywKTGkgV2FuZwoKLS0gCk1haWxpbmcgbGlz
dCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=

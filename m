Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SxWRMdP0e2mzJgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 01:01:23 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C131B5C98
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 01:01:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769731282; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=21vlBFgxOkDgKTgXwujRYaB0075IglCq34R186sndEs=;
 b=I4lRE1o1MQ9kKjKLFK+nldYnlACSJsqnuvYSpj8lFaIchwbGHV6XyWkE0ASfqJLPrTuOt
 km+sQOyhZrJVq0V5vh0wn9Wo2jZJ1oI9IH1uNwk/qaeaZf3CMn44b7LuK4ubloFWpbFTang
 CWfVQ5YPSgpENL9ZkJkl7lfyOogLmao=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7B183CB5BA
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Jan 2026 01:01:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1557A3C99DA
 for <ltp@lists.linux.it>; Fri, 30 Jan 2026 01:01:20 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 20BED14010D7
 for <ltp@lists.linux.it>; Fri, 30 Jan 2026 01:01:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769731277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4KxPRGdfegMBwQ/hLbFpzMjegW3BRDqHYNTfj1PyaQA=;
 b=aaoVDCjA7fpabXFrVn3KtpDL+c09eQ9hQI+c7rfmnQJGE/Ui0hWG8Foetfn9NQKTCOaZYV
 RfT33CTNZzkC9cinQ3gjAJCGCZm33sQH2qTzzHp6lsk/K4UVJ+FxGFTRs+kiM1XjqozKsz
 BKlwkU8JPsdwCm2qf1vhcW6/Y7AUHdw=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-AGYEVlJEPrCDJjafb3OI7g-1; Thu, 29 Jan 2026 19:01:16 -0500
X-MC-Unique: AGYEVlJEPrCDJjafb3OI7g-1
X-Mimecast-MFC-AGG-ID: AGYEVlJEPrCDJjafb3OI7g_1769731275
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-124a5098029so8297146c88.0
 for <ltp@lists.linux.it>; Thu, 29 Jan 2026 16:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769731274; x=1770336074;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4KxPRGdfegMBwQ/hLbFpzMjegW3BRDqHYNTfj1PyaQA=;
 b=JOQqokeC6eA+fkz2IQlClOoGEngzyH5fwk7Gr6aiLvpvaR/7QkmEYUn6I+jJYwNglL
 DA8f+PuvfJJ6OTKzsUXENjzD6NSl7Y9s74aYZ8ZOGbL7/iCNVK7/sZkO2oI1heAxyz3O
 kJaT/A1AjUeAFt5VivZN3EEBsUvxIeMZKD/34uuCtpicy+B/FCdp2jfAUEOEvEWmcjzp
 SxBN+eiMO5qrxTpsPAy7eAT+T3Jmf7VZUoKC9urR+aRpmHxC667Ho7wgSV3691fGyGGI
 DL8efmTOLAXxZb/mU49+SzAS6oeyK1fi0aSTFEcrI6T1G93St6D4BMIgI55s/PDjN6Cq
 ng8g==
X-Gm-Message-State: AOJu0YzeiQK13rCKXhdqvBiWj95BUCPSStZDKRMqGlZli7X89gD0prsT
 BJjYLtE0XS1gBzo8eJxQeZseAKiTiiwKlCgIxSvE2bfcWEwvGRqHFPDCySa84QJhVlCAycSQQtj
 aTRTFb9BTLDngySO0rJaOCb0syDUGa3d1iAFBpcKX8xPErkIGJP5Yzq4lVmJ+UiHl+q0vvqbYrO
 9asjc4/g5lqOgp06ghW5PCvrJaIDcsSEI2dRA=
X-Gm-Gg: AZuq6aL6Hd4nIaMjJzaiZ0eTfrMg88CYHYL8B6ZPhiN7lU97E7/1aYpSKUbT6VKhNIK
 12wgQOA1XICiLr1IONbLjB3zeh4qcyvPiFVteo4O3J/KlgWZd+msWKY3cBK5zkLgmzQEOwOBdFM
 qUkZUoTcB5dqnFx5kOd9P2lSN9Gsif0hW4UHwm1JSV3HOZf8v81tnBWQdWmEy9k1IZ5y0=
X-Received: by 2002:a05:7022:6899:b0:123:3584:de40 with SMTP id
 a92af1059eb24-125c10769aamr630119c88.50.1769731273780; 
 Thu, 29 Jan 2026 16:01:13 -0800 (PST)
X-Received: by 2002:a05:7022:6899:b0:123:3584:de40 with SMTP id
 a92af1059eb24-125c10769aamr630097c88.50.1769731273096; Thu, 29 Jan 2026
 16:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20260129100011.72437-1-liwang@redhat.com>
 <CAEemH2fppgf4iJE4h1n3XSMw9v-hMF11BZAYjz_-9dHgKv0iFg@mail.gmail.com>
 <aXtttXRzAF7Qj0Ea@yuki.lan>
In-Reply-To: <aXtttXRzAF7Qj0Ea@yuki.lan>
Date: Fri, 30 Jan 2026 08:01:01 +0800
X-Gm-Features: AZwV_QhZiWOe_ellrS4PypCgHyOtegs7OxxdtzhyOZJZzVRjPRpaUW-6B14dX-4
Message-ID: <CAEemH2c2veKPDH1WhHsR8XGoSV8dhXMBot-y1W9YT0jxRb6Vtg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y13Wfa3ZfpbwrhZ0l61b2Bd3k1o-qrpmhsirC3IsBvc_1769731275
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] cve-2017-17052: tolerate ENOMEM during test
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
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
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
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,picard.linux.it:helo,picard.linux.it:rdns,linux.it:url,suse.cz:email]
X-Rspamd-Queue-Id: 3C131B5C98
X-Rspamd-Action: no action

T24gVGh1LCBKYW4gMjksIDIwMjYgYXQgMTA6MjPigK9QTSBDeXJpbCBIcnViaXMgPGNocnViaXNA
c3VzZS5jej4gd3JvdGU6Cgo+IEhpIQo+ID4gICAgICAgICBmb3IgKDs7KSB7Cj4gPiAtICAgICAg
ICAgICAgICAgU0FGRV9NTUFQKE5VTEwsIDB4MTAwMDAwMCwgUFJPVF9SRUFELAo+ID4gKyAgICAg
ICAgICAgICAgIHB0ciA9IG1tYXAoTlVMTCwgMHgxMDAwMDAwLCBQUk9UX1JFQUQsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1BUF9QT1BVTEFURXxNQVBfQU5PTllNT1VTfE1B
UF9QUklWQVRFLAo+IC0xLCAwKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICBpZiAocHRyID09
IE1BUF9GQUlMRUQpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChlcnJubyA9PSBF
Tk9NRU0pIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXNsZWVwKDEwMDAp
Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgIH0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHRzdF9icmso
VEJST0sgfCBUVEVSUk5PLCAiVW5leHBlY3RlZCBtbWFwKCkKPiBlcnJvciIpOwo+Cj4gTWF5YmUg
dGhpcyBwYXJ0IHdvdWxkIGJlIG1vcmUgcmVhZGFibGUgd2l0aCBhbiBlbHNlIGJyYW5jaDoKPgo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChlcnJubyA9PSBFTk9NRU0pCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1c2xlZXAoMTAwMCk7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHN0X2JyayhUQlJP
SyB8IFRURVJSTk8sICJtbWFwKCkgZmFpbGVkIik7Cj4KCkdvb2Qgc3VnZ2VzdGlvbiwgcGF0Y2gg
bWVyZ2VkIGxpa2UgdGhpcy4gVGhhbmtzIQoKCi0tIApSZWdhcmRzLApMaSBXYW5nCgotLSAKTWFp
bGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==

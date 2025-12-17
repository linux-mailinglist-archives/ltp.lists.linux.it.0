Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2CBCC85B3
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Dec 2025 16:12:24 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE6313D03EE
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Dec 2025 16:12:23 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 56D543CF755
 for <ltp@lists.linux.it>; Wed, 17 Dec 2025 16:12:14 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D5E5C10004AA
 for <ltp@lists.linux.it>; Wed, 17 Dec 2025 16:12:09 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3FC6033686;
 Wed, 17 Dec 2025 15:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1765984328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YncB7umH4aaG+XTQEorT0kMDfmen0vuVl1nXsAZRMQ0=;
 b=pnwhDDqtrHV+Yc2nd2Dk2XPKiz2slneMO+aR5o4qR3vE7lfNRAvil2ngRYRUKffRBVeTvS
 HeM5NyBVPS665XkEo/EURo6CmEnMdz+Jj3fFk4p6PuccTIamQbn39UZMTMvyF1DYH2upzE
 qcl7YLB6g0Vev2PjUmkt6tpGdZNxQWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1765984328;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YncB7umH4aaG+XTQEorT0kMDfmen0vuVl1nXsAZRMQ0=;
 b=exd3w8pdqR/H4QTKD1/lBRdZPm3VBx+7YLrxd4562+cILIN2puGpi/53qcuUpauVPNeb3M
 XLx/aV8+9A0yRbDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1765984327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YncB7umH4aaG+XTQEorT0kMDfmen0vuVl1nXsAZRMQ0=;
 b=p2ZhrvLM7J94RqCQkxSgAbuSbrAmI02e7Wjoogpce4L4h6/GFxH/LOMxj1JpHHrBeIB+kh
 1oUMb5L7SyKpdumZjiG2D43wA2qjaaPlxEISaJer7A7NSpKQM1YTQUZ0rbgdEwR0Yrku4w
 7eRpi3NMS2GQFn8s/sMSHolhX54u/64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1765984327;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YncB7umH4aaG+XTQEorT0kMDfmen0vuVl1nXsAZRMQ0=;
 b=kkJm++JcZd/gK9qfrjuN0JrzI7PJCv/Lz6f0wsYb4P1GSTJ5fAjtxkaXXVz1l/qiRtbV/v
 mf6fXMBRrEnjlqBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 24F2D3EA63;
 Wed, 17 Dec 2025 15:12:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SjvjA0fIQmmNNAAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Wed, 17 Dec 2025 15:12:07 +0000
Date: Wed, 17 Dec 2025 16:13:09 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <aULIhXrMA4dgTwGg@yuki.lan>
References: <20251209185557.20598-1-pvorel@suse.cz>
 <20251209185557.20598-2-pvorel@suse.cz>
 <CAEemH2ej8-e_S4LgcKKkt08dUhyF0TreWp-QvXzQ1QGQYbywJg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2ej8-e_S4LgcKKkt08dUhyF0TreWp-QvXzQ1QGQYbywJg@mail.gmail.com>
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.993]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; MISSING_XM_UA(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, yuki.lan:mid,
 suse.cz:email]
X-Spam-Level: 
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v4 1/4] shell: Add tst_runas.c helper
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
Cc: selinux@vger.kernel.org, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Sm8hCj4gPiArICAgICAgIGNoYXIgKnVpZF9lbnYgPSBnZXRlbnYoVFNUX1RPX1NUUl8oTFRQX1VT
Ul9VSUQpKTsKPiA+ICsgICAgICAgY2hhciAqZ2lkX2VudiA9IGdldGVudihUU1RfVE9fU1RSXyhM
VFBfVVNSX0dJRCkpOwo+ID4KPiAKPiAKPiBTbyBmYXIgdGhpcyBmb3JtYXQgaXMgY29ycmVjdC4K
PiAKPiBCdXQgYXMgSSBwb2ludGVkIGluIHRoZSBsYXN0IHRocmVhZCwgaGVyZSB1c2luZyBUU1Rf
VE9fU1RSXyBtaWdodCBiZSBhCj4gcG90ZW50aWFsCj4gaXNzdWUgaWYgc29tZWRheSB3ZSBtYWtl
IGNoYW5nZXMgb24gdGhhdCB0byBiZWNvbWUgdHdvLWxldmVsIG1hY3JvLgo+IEl0IGxpa2VseSB0
byBpbnRlcnByZXRlZCBhcyAgZ2V0ZW52KCI2NTUzNCIpOwo+IAo+IFNvIG9uIHRoZSBzYWZlIHNp
ZGUsIEnigJlkIHN0aWxsIHJlY29tbWVuZCB3cml0aW5nIGl0IGV4cGxpY2l0bHk6Cj4gCj4gICAg
IGNoYXIgKnVpZF9lbnYgPSBnZXRlbnYoIkxUUF9VU1JfVUlEIik7Cj4gICAgIGNoYXIgKmdpZF9l
bnYgPSBnZXRlbnYoIkxUUF9VU1JfR0lEIik7CgorMQoKPiBUaGUgcmVzdCB3aG9sZSBwYXRjaCBz
ZXQgbG9va3MgZ29vZDoKPiAKPiBSZXZpZXdlZC1ieTogTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5j
b20+CgpGb3IgdGhlIHJlc3QgYWxzbyBmcm9tIG1lOgoKUmV2aWV3ZWQtYnk6IEN5cmlsIEhydWJp
cyA8Y2hydWJpc0BzdXNlLmN6PgoKLS0gCkN5cmlsIEhydWJpcwpjaHJ1YmlzQHN1c2UuY3oKCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

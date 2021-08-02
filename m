Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4253DDEB7
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:43:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55C583C8B08
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:43:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BFAF93C8A2B
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:43:56 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5A559600977
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:43:56 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B54A71FFDE;
 Mon,  2 Aug 2021 17:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627926235;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qt3Wk1C055whG1TO2nE5ocdPddtEYIGJ/3dVwgnfWks=;
 b=WS2qMok0r6O7SmUVdvVjj8pEDdyg13V26DdTM2lIh985mbIzj7cmxxJS9JFQhYg3POJGjw
 l52QV0nalerkhFSRVZJcOq3HHETliex1LeMDgXYbOW82aCKWE9S5UvkvIkQrsmdQLnozSD
 B7J0DU9gvb1TrRKJfNc3SWnML3LiFWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627926235;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qt3Wk1C055whG1TO2nE5ocdPddtEYIGJ/3dVwgnfWks=;
 b=If7Rtixp3IBovDqz/OlzlYSxNy951tH85GnJsI81NkkazH6OGvhlvaUoORpW5mfdgzMVOf
 aCf+O1PK4lh9gGBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8A51D13B47;
 Mon,  2 Aug 2021 17:43:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id V3LBH9suCGH+LgAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 02 Aug 2021 17:43:55 +0000
Date: Mon, 2 Aug 2021 19:43:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <YQgu0+DJ5V91sL4P@pevik>
References: <20210802163007.2282-1-pvorel@suse.cz>
 <CAASaF6y+nGtyH_OGdcJAa-UmnKW_6+HE6ZB=kDyWNpHu_c-Nug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6y+nGtyH_OGdcJAa-UmnKW_6+HE6ZB=kDyWNpHu_c-Nug@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] openposix/pthread_cancel/3-1: Move sleep loop
 into separate function
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgSmFuLAoKPiBPbiBNb24sIEF1ZyAyLCAyMDIxIGF0IDY6MzAgUE0gUGV0ciBWb3JlbCA8cHZv
cmVsQHN1c2UuY3o+IHdyb3RlOgoKPiA+IHRvIGZpeCB3YXJuaW5nOgo+ID4gcHRocmVhZF9jYW5j
ZWwvMy0xLmM6NDA6MTM6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHdhaXRlZF9mb3JfY2FuY2VsX21z
4oCZIG1pZ2h0Cj4gPiBiZSBjbG9iYmVyZWQgYnkg4oCYbG9uZ2ptcOKAmSBvciDigJh2Zm9ya+KA
mSBbLVdjbG9iYmVyZWRdCj4gPiAgICA0MCB8ICAgICAgICAgaW50IHdhaXRlZF9mb3JfY2FuY2Vs
X21zID0gMDsKCj4gPiBTdWdnZXN0ZWQtYnk6IE1hcnRpbiBEb3VjaGEgPG1kb3VjaGFAc3VzZS5j
ej4KPiA+IFNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgoKCj4gIEFj
a2VkLWJ5OiBKYW4gU3RhbmNlayA8anN0YW5jZWtAcmVkaGF0LmNvbT4KVGhhbmtzIGEgbG90LCBt
ZXJnZWQhCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6
Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK

Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B60E4135BE
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Sep 2021 17:00:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 055FE3C8863
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Sep 2021 17:00:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 575783C2201
 for <ltp@lists.linux.it>; Tue, 21 Sep 2021 17:00:26 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4D10210008F1
 for <ltp@lists.linux.it>; Tue, 21 Sep 2021 17:00:25 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A18701FEEE;
 Tue, 21 Sep 2021 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1632236424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5sTA19a4fFc7Jk4fR/e+yR5WOKfhUdyao2P93vvolQ8=;
 b=DpBur74L0fn6RfW7M72BFCrZIvelFOyuC3E9L0RTlf4cC9YockWb7Q5i/b8MhuJQNtLDkj
 19JQ/SXQeR5xmF+9J1AvprN+MfzrnjBOcnseYyZIzpMC/XBkNt/E9IficaiNk7K7vrf6os
 lVg0sMKV9/dnK7ZqLfsL8lBD55AsgHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1632236424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5sTA19a4fFc7Jk4fR/e+yR5WOKfhUdyao2P93vvolQ8=;
 b=Ti1NdURpMLGb23AHc68dsrybvVHpr+W0pzE2f6AYsIQM5XJTd87CHOrrZm4W8fvY9Kg5D1
 hFShDjSnSitTvDBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A8B113BD1;
 Tue, 21 Sep 2021 15:00:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Pl4oIYjzSWGDcAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 21 Sep 2021 15:00:24 +0000
Date: Tue, 21 Sep 2021 17:00:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YUnzptWTllL/el/x@yuki>
References: <a47ecbd7-ba4a-ff2c-ead9-e731040cb845@jv-coder.de>
 <20210914083444.23848-1-rpalethorpe@suse.com>
 <940b657a-ae79-a9f3-c2aa-30d441ad1e4e@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <940b657a-ae79-a9f3-c2aa-30d441ad1e4e@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] memcg_subgroup_charge: Remove limiting of parent
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I still don't know why the test even wants to limit anything, when it is 
> just checking what is charged.
> So I would still vote for completely removing the limits and simplifying 
> to just one test case.
> 
> But removing one limitation for now is a step in the right direction, so 
> I will not argue anymore :)

I've split the patch from Ritchie into two and pushed it so that we have
this fixed for the release. We should review and rethink these tests
once the release is finished since this isn't the only problem there.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

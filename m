Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B02B3B1E47
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 18:06:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE58F3C8A4B
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Jun 2021 18:06:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3B49D3C2021
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 18:06:48 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7377B200975
 for <ltp@lists.linux.it>; Wed, 23 Jun 2021 18:06:47 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C87AA2195D;
 Wed, 23 Jun 2021 16:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624464406;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1MdPPUN/EDcPjkplXBAIfTOP3fh5nqKB/znLE3+1lnI=;
 b=D3zBY3KcBViepTJDnJZl4aiiw5iV1tcAZLJ8BePlB5ODa4Zh0d9UQ0HqC47hznVDdx4PQW
 VTMbiQB871sCPQs9Z0lDhB2fWoP84Z9i5aaFW3dxgIPbj9O7HA3/pXz24ttfKjNW+ez0LL
 +UTiaCAR0o5aiLh2VMfT3SqN89w1wJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624464406;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1MdPPUN/EDcPjkplXBAIfTOP3fh5nqKB/znLE3+1lnI=;
 b=SjH31SRB76Z2lIVZ8TnVhUg5xcXzyENGJ+Y4+8gEml3g+mqrebJ3ryUiqIrG8eqb5BImXW
 DSuL600zFY3PW/BA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 75ED911A97;
 Wed, 23 Jun 2021 16:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624464406;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1MdPPUN/EDcPjkplXBAIfTOP3fh5nqKB/znLE3+1lnI=;
 b=D3zBY3KcBViepTJDnJZl4aiiw5iV1tcAZLJ8BePlB5ODa4Zh0d9UQ0HqC47hznVDdx4PQW
 VTMbiQB871sCPQs9Z0lDhB2fWoP84Z9i5aaFW3dxgIPbj9O7HA3/pXz24ttfKjNW+ez0LL
 +UTiaCAR0o5aiLh2VMfT3SqN89w1wJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624464406;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1MdPPUN/EDcPjkplXBAIfTOP3fh5nqKB/znLE3+1lnI=;
 b=SjH31SRB76Z2lIVZ8TnVhUg5xcXzyENGJ+Y4+8gEml3g+mqrebJ3ryUiqIrG8eqb5BImXW
 DSuL600zFY3PW/BA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id vo2BGRZc02CsFwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 23 Jun 2021 16:06:46 +0000
Date: Wed, 23 Jun 2021 18:06:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: James Dong =?utf-8?B?KOiRo+S4luaxnyk=?= <dongshijiang@inspur.com>
Message-ID: <YNNcFHTRmBtviT+Y@pevik>
References: <52e4b3cba7d74f17b64816acaf50be01@inspur.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52e4b3cba7d74f17b64816acaf50be01@inspur.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fix rpc_suite/rpc:add check returned value
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
Cc: "libtirpc-devel@lists.sourceforge.net"
 <libtirpc-devel@lists.sourceforge.net>,
 "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 Steve Dickson <SteveD@redhat.com>, "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Dong,

> Hi Petr
> I think this is just a simple test of some APIs, but some test cases are not standardized and cause errors like "Segmentation fault" during testing. I think it is necessary to fix these errors or delete these tests.

Sure this fix can get in. I saw issues with some tests on openSUSE, but that's a
separate problem (I was not able to find the problem thus report it.

> Kind regards,
> Dong

> > +++ b/testcases/network/rpc/rpc-tirpc/tests_pack/rpc_suite/rpc/rpc_createdestroy_svc_destroy/rpc_svc_destroy.c
> > @@ -46,6 +46,11 @@ int main(void)

> >  	//First of all, create a server
> >  	svcr = svcfd_create(fd, 0, 0);
> > +
> > +	//check returned value
> > +	if ((SVCXPRT *) svcr == NULL) {
IMHO casting is not required, right? Just
	if (svcr == NULL) {

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

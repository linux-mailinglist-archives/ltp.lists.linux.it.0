Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 065081CFE91
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 21:45:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 49E3C3C2465
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 21:45:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 51E4F3C0794
 for <ltp@lists.linux.it>; Tue, 12 May 2020 21:45:01 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 415691000AF8
 for <ltp@lists.linux.it>; Tue, 12 May 2020 21:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589312698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwEqoV3uqajispo5/h6+GUBdUU6sAO3/OT1TPjlLwBM=;
 b=VRlf7wqv74OaCfbvvDcgwRqfuj05Frtma5FOKK0hujZlPuWPtCD35rBiMfChTgevW5Nga+
 1fTTi3o0ecgfyTRZ/Wu8qowfTmm3ig2MemAkt1ghp/zKeyrSSagNVk70DTGLikZ7hXQ1t7
 ImzkpNP/dBXhuS6J78km6rZjU3wGO64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-_Ez53S3MNvu_VyGmrq4Rlg-1; Tue, 12 May 2020 15:44:52 -0400
X-MC-Unique: _Ez53S3MNvu_VyGmrq4Rlg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B02031B2C980;
 Tue, 12 May 2020 19:44:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A89DD6E6EB;
 Tue, 12 May 2020 19:44:48 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 786EF18095FF;
 Tue, 12 May 2020 19:44:48 +0000 (UTC)
Date: Tue, 12 May 2020 15:44:48 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>, Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <2136651671.12186381.1589312688262.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200512154935.GA24478@dell5510>
References: <20200512142824.13063-1-rpalethorpe@suse.com>
 <20200512142824.13063-2-rpalethorpe@suse.com>
 <20200512154935.GA24478@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.6]
Thread-Topic: pty04: Retry reads when short
Thread-Index: OTRCjnTM+JW7mmcYqJsN3JSqkKEXWQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] pty04: Retry reads when short
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> Hi Richard,
> 
> > Even though reads are blocking and packets are flipped into the netdevice
> > buffer whole, it seems read may return before a full packet is read into
> > user
> > land. Retrying read should prevent timeouts and read failures on some
> > machines.
> 
> > Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> > Reported-by: Jan Stancek <jstancek@redhat.com>
> > Cc: Petr Vorel <pvorel@suse.cz>
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> Thanks for taking care of this.

ACK, I'll update github issue when this runs for a while with recent upstream kernels.

> It's still possible to reproduce timeout just with higher -i (-i10),
> but it's an improvement.
> 
> Kind regards,
> Petr
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

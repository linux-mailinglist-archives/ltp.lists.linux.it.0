Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87163402DFA
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Sep 2021 19:52:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACD1D3C9735
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Sep 2021 19:52:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EE7AD3C2327
 for <ltp@lists.linux.it>; Tue,  7 Sep 2021 19:52:31 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 53196600078
 for <ltp@lists.linux.it>; Tue,  7 Sep 2021 19:52:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631037148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3pt4QjzQP9FuMefBEDpG9RPlE3ka9F5icuf/qqv1Nkw=;
 b=JzNx1CsZ9MFHw51NiNXDppZQTaN2nMjyExhavu5i37acJ/nN7Csv0Nd2K0+U3oxgCnkc1Z
 OBHzi2StC40SgFNMEp0151QwbWboQ4epuEQeK8BHeNwGl42v6qYk7Q713Fx+ajCcfrqBto
 zb5llttPuuN42Z5MkxCf1IBVG0lDmG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-2xniG6TGNteMZmZAoC5azg-1; Tue, 07 Sep 2021 13:52:25 -0400
X-MC-Unique: 2xniG6TGNteMZmZAoC5azg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 170AB84A5E0;
 Tue,  7 Sep 2021 17:52:24 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.17.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3038C60657;
 Tue,  7 Sep 2021 17:52:23 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id A8652220257; Tue,  7 Sep 2021 13:52:22 -0400 (EDT)
Date: Tue, 7 Sep 2021 13:52:22 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YTem1rCPHsgoohkp@redhat.com>
References: <20210905134541.GD15026@xsang-OptiPlex-9020>
 <YTXNXOKbrl17Lx+s@yuki>
MIME-Version: 1.0
In-Reply-To: <YTXNXOKbrl17Lx+s@yuki>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [xattr]  6e21a50861: ltp.setxattr02.fail
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
Cc: lkp@lists.01.org, kernel test robot <oliver.sang@intel.com>, lkp@intel.com,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Sep 06, 2021 at 10:12:12AM +0200, Cyril Hrubis wrote:
> Hi!
> > commit: 6e21a5086100cebefd21a3058a9e1160668f84fa ("xattr: Allow user.* xattr on symlink and special files")
> > https://github.com/rhvgoyal/linux user-xattr-symlink-v3
> 
> The test that fails is a test that asserts that you can't add extended
> attributes to a block or char device and it's obvious why this fails.
> 
> Feel free to ignore this failure, we will have to fix the tests once/if
> this patchset gets accepted upstream.

Yes, if patches get accepted, test will have to be fixed. I fixed
xfstest too in the same patch series.

But at the moment it looks like there is resistance to the idea of
allowing user.* xattrs on symlinks and special files.

Vivek

> 
> -- 
> Cyril Hrubis
> chrubis@suse.cz
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

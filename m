Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0A510D492
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 12:13:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A2513C226C
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Nov 2019 12:13:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1A5173C207C
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 12:13:01 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id B1795604C60
 for <ltp@lists.linux.it>; Fri, 29 Nov 2019 12:13:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575025979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxScUU+tLhB/hy64e2JXaID7fYPwFs1dmqeZUURfU1Y=;
 b=NmltBINf+n9izUg7qO7B5RThXR5b6ELoLMQEaCQ/Bb3MN8nNV4tq+mCbnHpyWLhoVkQWUT
 evWjt9hA5r1Td5VfRYAVuz1PFqsleZq+jCI+xCXV7HynWa86Nnuj0NwS4gQZL+DttQ4DUs
 giQQKt1fgDPfS/cN+TxE5bR0SbaGGOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-GquHScysM--BQVo7FW-s3A-1; Fri, 29 Nov 2019 06:12:55 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56E22107ACC7;
 Fri, 29 Nov 2019 11:12:53 +0000 (UTC)
Received: from localhost (dhcp-12-102.nay.redhat.com [10.66.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92A1360903;
 Fri, 29 Nov 2019 11:12:52 +0000 (UTC)
Date: Fri, 29 Nov 2019 19:20:54 +0800
From: Zorro Lang <zlang@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191129112053.GF4601@dhcp-12-102.nay.redhat.com>
Mail-Followup-To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>,
 ltp@lists.linux.it, linux-fsdevel@vger.kernel.org
References: <20191128173532.6468-1-zlang@redhat.com>
 <9c487d75-0de0-af8f-a439-d3ce9d965808@cn.fujitsu.com>
 <fa006742-d29d-4d19-c628-30b0454c8f72@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <fa006742-d29d-4d19-c628-30b0454c8f72@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: GquHScysM--BQVo7FW-s3A-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/newmount: new test case for new mount API
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
Cc: linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Nov 29, 2019 at 01:29:35PM +0800, Yang Xu wrote:
> 
> 
> on 2019/11/29 11:39, Yang Xu wrote:
> > --- /dev/null
> > +++ b/include/lapi/newmount.h
> > @@ -0,0 +1,106 @@
> > +/*
> > + * Copyright (C) 2019 Red Hat, Inc.  All rights reserved.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > + * modify it under the terms of the GNU General Public License as
> > + * published by the Free Software Foundation; either version 2 of
> > + * the License, or (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it would be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program; if not, write the Free Software Foundation,
> > + * Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
> > + */
> > +
> > +#ifndef __NEWMOUNT_H__
> > +#define __NEWMOUNT_H__
> > +
> > +#include <stdint.h>
> > +#include <unistd.h>
> > +#include "lapi/syscalls.h"
> > +
> > +#if !defined(HAVE_FSOPEN)
> When we run make autotools and ./configure, this macro is in
> "include/config.h". You should include this header file like other lapi
> files.

Oh, thanks, I refered to the include/lapi/stat.h file, it doesn't include
config.h, I don't know if it's needed.

Thanks,
Zorro

> > +static inline int fsopen(const char *fs_name, unsigned int flags)
> > +{
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

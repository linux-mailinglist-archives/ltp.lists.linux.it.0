Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6146532784B
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 08:39:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBB6F3C574F
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Mar 2021 08:39:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2119D3C4DCF
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 08:39:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A8FEF200040
 for <ltp@lists.linux.it>; Mon,  1 Mar 2021 08:39:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B714AD2B;
 Mon,  1 Mar 2021 07:38:59 +0000 (UTC)
Date: Mon, 1 Mar 2021 08:38:57 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YDyaEd7xNx3NcMGE@pevik>
References: <20210224165045.17738-1-chrubis@suse.cz>
 <20210224165045.17738-3-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224165045.17738-3-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [PATCH v2 2/5] lib: Add minimalistic
 json parser
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
Cc: Carlos Hernandez <ceh@ti.com>, Michal Simek <michals@xilinx.com>,
 automated-testing@yoctoproject.org, Orson Zhai <orsonzhai@gmail.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Nice work!

> +static int eatws(struct tst_json_buf *buf)
> +{
> +	while (!buf_empty(buf)) {
> +		switch (buf->json[buf->off]) {
> +		case ' ':
> +		case '\t':
> +		case '\n':
> +		case '\f':
Shouldn't there be '\r' as well? (handled at copy_str()).
> +		break;
> +		default:
> +			goto ret;
> +		}
> +
> +		buf->off += 1;
> +	}
> +ret:
> +	return buf_empty(buf);
> +}


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

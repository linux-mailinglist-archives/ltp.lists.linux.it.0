Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1502B2183
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 18:06:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D30AB3C2EBD
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 18:06:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 5EEE73C2EBD
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 18:06:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 89EE91401722
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 18:06:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF87DAEAE;
 Fri, 13 Nov 2020 17:06:53 +0000 (UTC)
Date: Fri, 13 Nov 2020 18:06:52 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it, Li Wang <liwang@redhat.com>
Message-ID: <20201113170652.GA29443@pevik>
References: <20201103191327.11081-1-pvorel@suse.cz>
 <20201112131139.GA4962@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112131139.GA4962@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 00/11] 	Test metadata extraction
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
Cc: automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

...
> Anybody against pushing whole patchset [1] with fix below for third commit
> ("docparse: Add test documentation parser").

Going to merge whole patchset with diff below
(https://github.com/pevik/ltp/commits/test-metadata-extraction.v2.fixes).

Can I add you Reviewed-by: tag to whole patchset or a subset?

Kind regards,
Petr


> Kind regards,
> Petr

> [1] https://patchwork.ozlabs.org/project/ltp/list/?series=211956&state=*

> Fix for third commit:

> diff --git docparse/docparse.c docparse/docparse.c
> index 63d131c87..be6125353 100644
> --- docparse/docparse.c
> +++ docparse/docparse.c
> @@ -138,10 +138,8 @@ const char *next_token(FILE *f, struct data_node *doc)

>  		if (in_str) {
>  			if (c == '"') {
> -				if (i == 0 || buf[i-1] != '\\') {
> -					buf[i++] = c;
> +				if (i == 0 || buf[i-1] != '\\')
>  					goto exit;
> -				}
>  			}

>  			buf[i++] = c;
> @@ -189,7 +187,7 @@ const char *next_token(FILE *f, struct data_node *doc)
>  	}

>  exit:
> -	if (i == 0)
> +	if (i == 0 && !in_str)
>  		return NULL;

>  	buf[i] = 0;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

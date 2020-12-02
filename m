Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EC82CC125
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Dec 2020 16:45:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6CE823C590B
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Dec 2020 16:45:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DA2E73C4CCE
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 16:45:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5B2221A00CA0
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 16:45:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5F87AB7F;
 Wed,  2 Dec 2020 15:45:10 +0000 (UTC)
Date: Wed, 2 Dec 2020 16:46:04 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20201202154604.GD12342@yuki.lan>
References: <20201201174214.24625-1-pvorel@suse.cz>
 <20201201174214.24625-5-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201174214.24625-5-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 04/10] fanotify: Add helper for FAN_REPORT_FID
 support on fs
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

Hi!
> +/*
> + * @return  0: fanotify supported both in kernel and on tested filesystem
> + * @return -1: FAN_REPORT_FID not supported in kernel
> + * @return -2: FAN_REPORT_FID not supported on tested filesystem
> + */
> +static inline int fanotify_fan_report_fid_supported_on_fs(const char *fname)
> +{
> +	int fd;
> +	int rval = 0;
> +
> +	fd = fanotify_init(FAN_CLASS_NOTIF | FAN_REPORT_FID, O_RDONLY);
> +
> +	if (fd < 0) {
> +		if (errno == ENOSYS)
> +			tst_brk(TCONF, "fanotify not configured in kernel");
> +
> +		if (errno == EINVAL)
> +			return -1;
> +
> +		tst_brk(TBROK | TERRNO, "fanotify_init() failed");
> +	}
> +
> +	if (fanotify_mark(fd, FAN_MARK_ADD, FAN_ACCESS, AT_FDCWD, fname) < 0) {
> +		if (errno == ENODEV || errno == EOPNOTSUPP || errno == EXDEV) {
> +			rval = -2;
> +		} else {
> +			tst_brk(TBROK | TERRNO,
> +				"fanotify_mark (%d, FAN_MARK_ADD, ..., AT_FDCWD, \".\") failed", fd);
                                                                                   ^
										   fname?
> +		}
> +	}
> +
> +	SAFE_CLOSE(fd);
> +
> +	return rval;
> +}
> +
> +typedef void (*tst_res_func_t)(const char *file, const int lineno,
> +		int ttype, const char *fmt, ...);
> +
> +static inline void fanotify_fan_report_fid_err_msg(const char *file,
> +	const int lineno, tst_res_func_t res_func, int fail)
> +{
> +	if (fail == -1)
> +		res_func(file, lineno, TCONF,
> +			 "FAN_REPORT_FID not supported in kernel?");
> +
> +	if (fail == -2)
> +		res_func(file, lineno, TCONF,
> +			 "FAN_REPORT_FID not supported on %s filesystem",
> +			 tst_device->fs_type);
> +}

Maybe this would be just easier to read as a macro:

#define FANOTIFY_FAN_REPORT_FID_ERR_MSG(res_func, fail) do { \
	if (fail == -1) \
		res_func(TCONF, "FAN_REPORT_FID not supported in kernel?"); \
	if (fail == -2) \
		res_func(TCONF, ...); \
	} while (0)

> +#define FANOTIFY_FAN_REPORT_FID_ERR_MSG(fail) \
> +	fanotify_fan_report_fid_err_msg(__FILE__, __LINE__, tst_res_, (fail))
> +
> +static inline void require_fanotify_fan_report_fid_supported_on_fs(const char *file,
> +	const int lineno, const char *fname)
> +{
> +	int rval;
> +
> +	rval = fanotify_fan_report_fid_supported_on_fs(fname);
> +	if (rval)
> +		fanotify_fan_report_fid_err_msg(file, lineno, tst_brk_, rval);

We don't have to do the if here, just pass the rval, it will not trigger
tst_brk() if we pass zero.


The rest is good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB631C3493
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:37:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12AC83C26A4
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 10:37:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 013AC3C26E4
 for <ltp@lists.linux.it>; Sat,  2 May 2020 11:39:41 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B74CA1A011D3
 for <ltp@lists.linux.it>; Sat,  2 May 2020 11:39:40 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id x77so2823695pfc.0
 for <ltp@lists.linux.it>; Sat, 02 May 2020 02:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mbobrowski-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8TGao7Uhxjzl01GESHE0c4gkk/B0idqFuE87vKigyr0=;
 b=hh7o66Lhxc5aiZ0L7xrDDLg87weA1N4r2O7vaFSoeQ6dc8opmNvnpsWsNe5BzYoXia
 W06VeS6t9zVvhV4qtyjdh3RqrCXsYVmq8dklgSY3DTMuHOkW3g9Vq+X/EZs1N02LNmr5
 gH9/U9kexqm/u8RZefVlt8Zrh3J1yCiO33+AhFeKsGaFY0pRdZOXqUp9iOK92aNVftAh
 QNB2s5Dl9HphUKJzpHRQwbfmgaoosxQi8Onn7UyKbPaDdO8gWDj4i/HGGSh+pTFt6W5N
 f2AUDfxm6Ah5YkJF7gYRRS0zN4x1smzgz4mGjQDqGeYMx36cm7AzI4G/2m1MQ26CxSGi
 aS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8TGao7Uhxjzl01GESHE0c4gkk/B0idqFuE87vKigyr0=;
 b=lvPDcX9dhvFQdyQx2nGUcW7P2V+zJ0/ixCiXksBlsLxNARivp79Ye0ZCae7Xtbft1s
 9oemErMFrM7kFu/eLskwTd/cZWCNHyGJxQUjATvliiTpalRNDXxh6IPf04nM7CN7sTi1
 5qsi13nWDlA63x/Uh2rXtKgJda+9wwcIe/yrHIjEQUFn0pEdxNelVek0if7VY0hla8xH
 WcaLq2Zw3S684Kyp+NmFnGqF08eudOB4IYe30qWYGtcHQ4wjLPFYypNVrm7bz4vHw/Yo
 Ur8qfulCKJ4ll0rHeaUC4El1O5iNpwxwIDtS4SAJPS4/QfZDigoAIxf2Nu+lsHO/C0QM
 HWtQ==
X-Gm-Message-State: AGi0Pubt4MYb1GqoeRpxK+BIqbFPFtxDGJt89HhnqdgD3RHwXLQvVi+f
 6/WQsvwM9xZG8gtZjmtM+aNY
X-Google-Smtp-Source: APiQypJOz3b+iTcvmuPSnFOCBidPobY78gW6GO/afGSGGYIJDdP7KwhaKjQ0KJ79hYfhjlEo4nFcyQ==
X-Received: by 2002:a62:6dc3:: with SMTP id i186mr7578637pfc.273.1588412378954; 
 Sat, 02 May 2020 02:39:38 -0700 (PDT)
Received: from morpheus.bobrowski.net (49.37.70.115.static.exetel.com.au.
 [115.70.37.49])
 by smtp.gmail.com with ESMTPSA id b5sm4120192pfb.190.2020.05.02.02.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 02:39:38 -0700 (PDT)
Date: Sat, 2 May 2020 19:39:33 +1000
From: Matthew Bobrowski <mbobrowski@mbobrowski.org>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200502093931.GB1649@morpheus.bobrowski.net>
References: <20200421065002.12417-1-amir73il@gmail.com>
 <20200421065002.12417-5-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421065002.12417-5-amir73il@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 04 May 2020 10:36:17 +0200
Subject: Re: [LTP] [PATCH 4/4] syscalls/fanotify: New test for FAN_MODIFY_DIR
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Apr 21, 2020 at 09:50:02AM +0300, Amir Goldstein wrote:
> +void save_fid(const char *path, struct fid_t *fid)
> +{
> +	int *fh = (int *)(fid->handle.f_handle);
> +	int *fsid = fid->fsid.val;
> +
> +	fh[0] = fh[1] = fh[2] = 0;
> +	fid->handle.handle_bytes = MAX_HANDLE_SZ;
> +	fanotify_get_fid(path, &fid->fsid, &fid->handle);
> +
> +	tst_res(TINFO,
> +		"fid(%s) = %x.%x.%x.%x.%x...",
> +		path, fsid[0], fsid[1], fh[0], fh[1], fh[2]);
> +}

What do you think about pulling this out and shoving it in fanotify.h
as another helper? Perhaps future tests would/could also make use of
this routine.

> +static void do_test(unsigned int number)
> +{
> +	int len = 0, i = 0, test_num = 0;
> +	int tst_count = 0;
> +	int fd;

Just shove all these on one line?

> +	if (fanotify_mark(fd_notify, FAN_MARK_ADD | mark->flag, tc->mask,
> +			  AT_FDCWD, MOUNT_PATH) < 0) {
> +		if (errno == EINVAL) {
> +			tst_brk(TCONF,
> +				"FAN_DIR_MODIFY not supported by kernel");
> +			return;
> +		}
> +		tst_brk(TBROK | TERRNO,
> +		    "fanotify_mark (%d, FAN_MARK_ADD | %s, "
> +		    "FAN_DIR_MODIFY, AT_FDCWD, '"MOUNT_PATH"') "
> +		    "failed", fd_notify, mark->name);

Should we be adding tc->mask here to the format string output?

> +	/*
> +	 * Create subdir and watch open events "on children" with name.
> +	 */
> +	if (mkdir(dname1, 0755) < 0) {
> +		tst_brk(TBROK | TERRNO,
> +				"mkdir('"DIR_NAME1"', 0755) failed");
> +	}

Perhaps we should be making use of the SAFE_MACROS() so that we're
adhering to the test writing guidelines?

> +	if (tc->sub_mask &&
> +	    fanotify_mark(fd_notify, FAN_MARK_ADD | sub_mark->flag, tc->sub_mask,
> +			  AT_FDCWD, dname1) < 0) {
> +		tst_brk(TBROK | TERRNO,
> +		    "fanotify_mark (%d, FAN_MARK_ADD | %s, "
> +		    "FAN_DIR_MODIFY | FAN_DELETE_SELF | FAN_ONDIR, "
> +		    "AT_FDCWD, '%s') "
> +		    "failed", fd_notify, sub_mark->name, dname1);
> +	}

Maybe just replace the statically typed mask here with tc->sub_mask?
That way, if test cases are added or modified in the future, you don't
have to update it?

> +	if ((fd = creat(fname1, 0755)) == -1) {
> +		tst_brk(TBROK | TERRNO,
> +			"creat(\"%s\", 755) failed", FILE_NAME1);
> +	}
> +
> +	if (rename(fname1, fname2) == -1) {
> +		tst_brk(TBROK | TERRNO,
> +				"rename(%s, %s) failed",
> +				FILE_NAME1, FILE_NAME2);
> +	}
> +
> +	if (close(fd) == -1) {
> +		tst_brk(TBROK | TERRNO,
> +				"close(%s) failed", FILE_NAME2);
> +	}
> +
> +	/* Generate delete events with fname2 */
> +	if (unlink(fname2) == -1) {
> +		tst_brk(TBROK | TERRNO,
> +				"unlink(%s) failed", FILE_NAME2);
> +	}

The same applies with the above set of system calls? 

...

> +	if (rename(dname1, dname2) == -1) {
> +		tst_brk(TBROK | TERRNO,
> +				"rename(%s, %s) failed",
> +				DIR_NAME1, DIR_NAME2);
> +	}
> +
> +	if (rmdir(dname2) == -1) {
> +		tst_brk(TBROK | TERRNO,
> +				"rmdir(%s) failed", DIR_NAME2);
> +	}


And here...

> +	while (i < len) {
> +		struct event_t *expected = &event_set[test_num];
> +		struct fanotify_event_metadata *event;
> +		struct fanotify_event_info_fid *event_fid;
> +		struct file_handle *file_handle;
> +		unsigned int fhlen;
> +		const char *filename;
> +		int namelen, info_type;
> +
> +		event = (struct fanotify_event_metadata *)&event_buf[i];
> +		event_fid = (struct fanotify_event_info_fid *)(event + 1);
> +		file_handle = (struct file_handle *)event_fid->handle;
> +		fhlen = file_handle->handle_bytes;
> +		filename = (char *)file_handle->f_handle + fhlen;
> +		namelen = ((char *)event + event->event_len) - filename;
> +		/* End of event could have name, zero padding, both or none */
> +		if (namelen > 0) {
> +			namelen = strlen(filename);
> +		} else {
> +			filename = "";
> +			namelen = 0;
> +		}
> +		if (expected->name[0]) {
> +			info_type = FAN_EVENT_INFO_TYPE_DFID_NAME;
> +		} else {
> +			info_type = FAN_EVENT_INFO_TYPE_FID;
> +		}

Can we line break these conditional statements?

...

> +static void setup(void)
> +{

	int fd;

	fd = SAFE_FANOTIFY_INIT(FAN_CLASS_NOTIF, 0_RDONLY);
	SAFE_CLOSE(fd);

Above snippet missing from test bootstrap? I remember we had to add
this in the past, but I can't remember the _why_?

Anyway, the functionality testing looks fine to me.

Reviewed-by: Matthew Bobrowski <mbobrowski@mbobrowski.org>

/M

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
